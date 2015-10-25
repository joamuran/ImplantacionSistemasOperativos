# Gestores de Arranque

Arranque de un Sistema Informático.
Ya hemos visto anteriormente que el hardware, por si solo es totalmente incapaz de realizar ninguna acción, necesita un software que le indique que tiene que hacer. Cuando encendemos un sistema informático, estamos poniendo en marcha hardware, por lo que se necesitan medios especiales para hacer que se cargue un primer software.

Actualmente podemos encontrar dos tipos de **BIOS**: EFI (UEFI) y **BIOS**. Trataremos el arranque primero en las **BIOS**, ya que muchos conceptos son más sencillos de entender en las **BIOS** tradicionales que en las nuevas EFI (UEFI).

## Arranque Inicial. **POST**
En los ordenadores compatibles actuales el proceso de carga de un sistema operativo cualquiera se compone de una serie de pasos que se inician cuando se enciende o reinicia el ordenador. El proceso comienza siempre en la **BIOS**, y salvando algunas pequeñas variaciones que puede haber en función de cada fabricante de hardware y de la propia **BIOS**, el desarrollo paso a paso de esta secuencia es el siguiente:

1. Cuando se da tensión a la fuente de alimentación y una vez que la alimentación se estabiliza, genera una señal denominada **Power Good** en uno de los cables que va de la fuente de alimentación a la placa base; esta señal es recibida en el juego de chips instalado en la referida placa, y a su vez generan una señal de reinicio (reset) al procesador. La finalidad de este proceso es evitar que el procesador arranque prematuramente, cuando las tensiones de alimentación no son todavía correctas, lo que podría producir daños en el hardware. Es el mismo sistema que se utiliza para un reinicio en caliente cuando pulsa en el botón marcado "Reset".

2. El procesador arranca cuando se retira la señal de reset. En este momento no existe en su memoria ninguna instrucción o dato, por lo que no puede hacer absolutamente nada. Para salvar este obstáculo, los fabricantes incluyen en la circuitería (hardware) de la placa base un mecanismo especial. El sistema se dirige a una dirección fija de memoria (la *FFFF0h* en concreto). Esta dirección, generalmente está situada muy cerca del final de la memoria del sistema, es el punto de inicio de la **BIOS**. En realidad este punto de inicio contiene una instrucción de salto (jump) que indica al procesador donde tiene que dirigirse para encontrar el punto donde comienza realmente el programa de carga (**BOOTSTRAP**) de la **BIOS**. Este programa contenido en esa dirección se lleva a la CPU y se ejecuta.

3. La primera parte de este programa de la **BIOS** inicia un proceso de comprobación del hardware denominado **POST** (*Power On Self Test*), en caso de existir errores graves, el programa se detiene emitiendo una serie de pitidos que podemos encontrar su significado en [Bios Central](http://www.bioscentral.com/) que indican el tipo de error encontrado. El orden de las comprobaciones del **POST** depende del fabricante, pero generalmente la secuencia de comprobaciones se resume como sigue:

  1. Comprobación del procesador.
  2. Varias comprobaciones sobre la memoria RAM.
  3. Inicializar los dispositivos de video y teclado. La comprobación del dispositivo de video incluye cargar y ejecuta la parte de **BIOS** incluida en el adaptador de video. La mayoría de las adaptadoras modernas muestran en pantalla información sobre sí mismas; es por esta razón por la que, a veces,lo primero que se ve en pantalla es información sobre la propia controladora de video antes que ningún mensaje de la **BIOS** del sistema.
  4. Determinar el tamaño de la RAM completa y comprobar su funcionamiento (el recuento que se ve en pantalla). Si llegado a este punto existiera algún error en la memoria se mostraría un mensaje de error (el dispositivo de video ya está operativo, así que no hace falta emitir pitidos).
  5. Inicializar los puertos: COM (comunicaciones serie), LPT (comunicaciones paralelo), USB, S-ATA, SCSI, etc.
  6. Inicializar, en su caso, el sistema de disquete (**OBSOLETO**)
  7. Inicializar el sistema IDE, S-ATA o SCSI. (Discos duros, CDROMS, etc.).

4. A continuación la **BIOS** recorre la memoria en busca de la posible existencia de otros programas en ROM para ver si alguno tiene **BIOS**, lo que ocurre por ejemplo, con los controladores de disco duro IDE/ATA, cuyas **BIOS** se encuentran en la dirección *C8000h*; otros elementos que suelen contar con sus propias **BIOS** son las tarjetas de red y las controladoras SCSI. Estos módulos son cargados y ejecutados.
5. A continuación, el **BIOS** muestra su pantalla principal (generalmente con los créditos del fabricante número de versión y fecha). Como hemos visto, la **BIOS** realiza una especie de inventario del sistema y algunas pruebas para verificar que su funcionamiento es correcto, y en esta pantalla muestra un resumen de los mismos. En los PC originales la configuración del hardware disponible se efectuaba mediante interruptores ("Jumpers") situados en la placa-base. Hoy en día se utiliza el estándar **PnP** (*Plug and Play*), que es capaz por sí mismo de detectar y configurar los dispositivos conectados, asignándoles los recursos necesarios y mostrando un mensaje en pantalla por cada uno instalado.

La última instrucción del programa **POST** se encarga de buscar otro programa que pueda ser cargado en el procesador del PC para que se
encargue de seguir arrancando el sistema informático, normalmente cargando ya un sistema operativo. ¿Pero dónde buscará el **POST** el programa a cargar? Y en caso de que existan varios sistemas operativos en varios soportes, ¿cuál de ellos será el elegido?
