\newpage

# Gestores de Arranque

## Importante
 * Entender el proceso de arranque del equipo.
 * Saber solucionar los problemas más habituales de arranque.
 * Seleccionar un dispositivo diferente para arrancar desde ahí.
 * Como se le indica al sistema que quiero arrancar con determinado SO.
 * Entender como están organizados los discos duros.
 * Conocer las secuencias de arranque de :
 * Windows XP
 * Windows 2008/7
 * Windows 8/10
 * GNU/LinuX

## Arranque de un Sistema Informático.

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
5. A continuación, la **BIOS** muestra su pantalla principal (generalmente con los créditos del fabricante número de versión y fecha). Como hemos visto, la **BIOS** realiza una especie de inventario del sistema y algunas pruebas para verificar que su funcionamiento es correcto, y en esta pantalla muestra un resumen de los mismos. En los PC originales la configuración del hardware disponible se efectuaba mediante interruptores ("Jumpers") situados en la placa-base. Hoy en día se utiliza el estándar **PnP** (*Plug and Play*), que es capaz por sí mismo de detectar y configurar los dispositivos conectados, asignándoles los recursos necesarios y mostrando un mensaje en pantalla por cada uno instalado.

La última instrucción del programa **POST** se encarga de buscar otro programa que pueda ser cargado en el procesador del PC para que se
encargue de seguir arrancando el sistema informático, normalmente cargando ya un sistema operativo. ¿Pero dónde buscará el **POST** el programa a cargar? Y en caso de que existan varios sistemas operativos en varios soportes, ¿cuál de ellos será el elegido?

\newpage
## Elección del Sistema Operativo

En este punto en el que estamos el programa que está en la CPU es el **POST**, y ya ha concluido todo su trabajo. Pero si dicho programa simplemente liberará la CPU, el equipo se quedaría colgado ya que ningún otro software entraría en el microprocesador. Por ello, la última misión del **POST** es buscar otro programa, y cargarlo en la CPU antes de liberarla.
En un sistema informático actual podemos tener múltiples discos duros, cada uno de ellos con varias particiones donde pueden estar almacenados varios sistemas operativos, podemos tener un CD en la unidad lectora que también cuente con su propio sistema operativo, podemos tener un disquete de inicio en la disquetera, podemos tener un pequeño sistema operativo en
un dispositivo USB, podemos tener un disco duro externo conectado por FireWire; etc. ¿Cómo puede saber el **POST** a cuál de todos estos programas cederle el control?

De momento, en la **BIOS** de casi todos los equipos modernos es posible encontrar unas opciones que indican cual es el soporte de información desde el cual se va a arrancar el sistema (Boot).
Normalmente estas opciones se encuentran en la segunda opción que aparece en el menú de la **BIOS** (opciones avanzadas de la **BIOS** ó Advanced **BIOS** Features).

En alguna opción de la **BIOS**, normalmente se nos permite indicar varios dispositivos ordenados que utilizaremos para el arranque. Una opción que se puede dejar por defecto, es indicar que se arranque desde el Floppy (*Disquetera*) si existe, luego desde el CD, y por fin del HDD, para que nos permita arrancar el sistema desde disquete, si no existe desde CD, y si tampoco hay ningún CD de arranque, desde el disco duro.

En las **BIOS** más modernas, veremos que también podemos indicarle que arranque desde un puerto USB, desde un puerto SATA, etc.
Sin embargo, es posible que en disco duro tengamos varios sistemas operativos para arrancar en nuestra maquina en varias particiones. Además, podemos tener varios discos duros en nuestro sistema, y en cada disco podemos tener varios sistemas operativos instalados.

Desde la **BIOS** vemos cómo podemos indicar de qué dispositivo queremos arrancar. Podemos indicar normalmente si queremos arrancar desde el disco duro, desde el CD, USB, etc.

Hay **BIOS** desde donde se puede indicar incluso desde cuál de los discos duros queremos arrancar (HDD- 0, HDD-1, etc.) Hay que tener en cuenta que en algunas **BIOS** esta facilidad para distinguir entre los distintos discos duros no está presente, o no funciona bien. En los casos en que esto ocurra, tendremos que introducirnos en la **BIOS** y desactivar los discos duros de los que no queremos que arranque. Así, por ejemplo, en un sistema informático de dos discos duros si queremos arrancar desde el primer disco duro no tenemos que hacer nada pero si queremos arrancar desde el segundo disco duro desactivaremos el primero en la **BIOS**.

Para desactivar los discos duros, hay que entrar en la primera opción de la **BIOS** y poner None, not instaled, o algo parecido en el tipo de disco duro que queremos desactivar. Esto no quiere decir que dichos discos duros no se usarán durante el funcionamiento normal de la máquina, sino que no se usarán en el proceso de arranque.

Pero con esto conseguimos indicar al sistema informático que disco duro quiero utilizar para el arranque del sistema... pero resulta que en un solo disco duro puedo tener instalado más de un sistema operativo.

\newpage
## Organización lógica de un disco duro.

La estructura lógica de los discos duros es la siguiente:

 * Tienen una tabla de particiones en el primer sector.
 * Pueden crearse de una a cuatro particiones.
 * Cada partición tiene su propio sector de arranque.

![Organizacion HD](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/OrganizacionHD.PNG)

\newpage

Las particiones son divisiones lógicas efectuadas en un disco duro. Responden a una necesidad muy importante en informática: compartir un mismo disco duro para varios sistemas operativos. Cada partición tiene la estructura lógica correspondiente a su sistema operativo.

### Partición Windows XP en FAT32 :

 * sector de arranque.
 * FAT
 * directorio raíz
 * área de datos

### Particiones NTFS de Windows 7:
 * sector de arranque y
 * sector de MFT
 * etc.

Sin embargo los datos de una partición no se mezclan con los de otra.

En un disco duro con una **BIOS** **distinta a EFI** podemos tener hasta 4 particiones **primarias** como **máximo**. De las 4, solo una puede estar definida como activa al mismo tiempo. Esta partición activa será la que cargue el sistema operativo cuando iniciamos el sistema
informático.

En el primer sector de todo disco duro no se sitúa un sector de arranque (puede haber un sector de arranque por cada partición, por lo que es posible que en un disco duro existan 4 sectores de arranque), en su lugar se sitúa una tabla de particiones (Master Boot Record o *MBR*). Esta tabla de particiones incluye una tabla donde definimos las 4 particiones que pueden estar presentes en nuestro disco duro y un pequeño programa que permite localizar la partición activa, leer su sector de arranque y usarlo para arrancar nuestro sistema informático.

Este *MBR* (Master Boot Record) está situada en el primer sector del disco duro, de modo que su tamaño es de 512 bytes. En esta capacidad se almacena lo siguiente por cada *MBR*:

Un programa *MBR* estándar, leerá la tabla de particiones y escogerá de cual de esas particiones va a arrancar el sistema operativo. No lo hará como podría parecer lógico de la primera partición, sino de la partición primaria que esta marcada como activa. El *MBR* lee el primer sector de esa partición, y le cede el control de la CPU a ese programa (Boot Sector).

Hay que indicar que no existe un programa *MBR* estándar. En realidad, el código que se encuentra aquí, puede ser muy variado, aunque normalmente todos son compatibles. Podemos instalar programas *MBR* conocidos como gestores de arranque que amplían las posibilidades el gestor de arranque *MBR* instalado por defecto.

\newpage
Si se arranca desde un disco duro, se lee el primer sector (*MBR*) y este a su vez, lee un segundo sector (Boot Sector).Vemos también como existen 4 entradas para almacenar hasta 4 particiones. De aquí viene el límite de 4 particiones para un disco duro. Por cada una de estas entradas de 16 Bytes se almacena lo siguiente:

| Dirección | Contenido| Tipo|
|-----------|----------|-----|
|+000h|Programa *MBR*.|445 Bytes.|
|+1BEh |1º entrada de la tabla de particiones|16 Bytes|
|+1CEh |2º entrada de la tabla de particiones|16 Bytes|
|+1DEh |3º entrada de la tabla de particiones| 16 Bytes|
|+1EEh |4º entrada de la tabla de particiones|16 Bytes|
|+1FEh| Identificación (AA55h)| 2 Bytes|

*Contenido del Master Boot Record o *MBR*.*
*Longitud = 200h = 512 Bytes.*
*El código AA55h marca este sector como ejecutable.*

\newpage
## Tipos de particiones

Las particiones de un disco duro pueden ser de dos tipos:

 1. Primarias
 2. Extendidas

En un disco duro puede haber 4 particiones como máxima, lo que implica que puede haber 4 particiones primarias como máximo (ya lo hemos dicho antes).

Cada partición primaria forma un volumen (una letra de unidad, para entendernos) y tiene su propio sector de arranque.

![MBR](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/MBR.PNG)

Una partición extendida sin embargo, no forma ningún volumen, ni tiene un sector de arranque como tal. Una partición extendida en realidad es un contenedor de unidades lógicas.

Cada unidad lógica que se crea dentro de una unidad extendida si forma su propio volumen, aunque no tiene un sector de arranque real, sino que usa su sector de arranque para controlar su tamaño entre otras cosas.

De esta manera, si dividimos un disco duro en una partición primaria (un volumen) y una partición extendida (donde creamos 10 unidades lógicas, cada una con su propio volumen) formaremos un total de 11 volúmenes (11 letras de unidad) pero solo tendremos un sector de arranque usable como tal, el de la partición primaria.

![MBR 2](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/MBR_2.PNG)

Solo el sector de arranque de una partición primaria es válido para arrancar el sistema operativo. El sector de arranque de la partición extendida solo contiene información sobre las unidades lógicas que se encuentran dentro de ella (tamaños, comienzos y finales, etc.).

La tabla del *MBR* identifica la localización y tamaño de la partición extendida, pero no contiene información sobre las unidades lógicas creadas dentro de esta partición extendida. Ninguna de estas unidades lógicas pueden ser marcadas como activas, por lo que es posible que instalemos un sistema operativo en alguna de estas particiones lógicas, pero nunca podrá ser cargado directamente, ya que no podemos marcar esa partición como activa, y por lo tanto no podemos indicar que sea el volumen de arranque. (Para poder instalar sistemas operativos en estas unidades lógicas, tendremos que usar un programa conocido como gestor de arranque que veremos posteriormente, estos gestores de arranque suelen guardar los programas usados para cargar los sistemas operativos siempre en la partición activa del disco duro).

![MBR 3](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/MBR_3.PNG)

Hemos visto como el *MBR* se divide en dos partes bien diferenciadas, el programa *MBR* que ocupa la mayor parte del *MBR* y la tabla de particiones vista anteriormente.

Existen diversos programas que nos permiten gestionar y retocar estos componentes del *MBR*.
Así, en Windows tenemos el comando FIXMBR que reinstala el programa del *MBR*, aunque este comando solo podemos usarlo desde la consola de recuperación. (Ya veremos cómo acceder a dicha consola en otro tema)

Sin embargo, no puede oficialmente por la propia Microsoft, y existen multitud de programas de terceras compañías que permiten retocar esta tabla de particiones. (No es recomendable el uso de dichas herramientas pues pueden estropear la tabla, y suelen dar problemas a la larga). En la familia Windows 2008, Vista, Windows 7, 8.1, 10 encontramos también una herramienta de línea de comandos que permite gestionar las particiones, diskpart.exe.

![Diskpart](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/Diskpart.PNG)

Linux por su parte incluye varios programas de este tipo, como pueden ser fdisk, qtparted, gparted, parted, etc.

Los Windows modernos (a partir de ahora les llamaremos Windows de la familia NT, o Windows NT) permiten indicar que letra de unidad se le asignará a cada partición, sin embargo DOS y Windows 95/98 asignaban estas letras por defecto. Primero, la C: es asignada a la partición primaria del primer disco donde se encuentre un sistema de ficheros FAT. Entonces la siguiente letra es asignada a la partición primaria con FAT del segundo disco, etc. Una vez acabadas con las particiones primarias de cada disco, se empiezan a asignar letras a las unidades lógicas del primer disco, luego a las unidades lógicas del segundo disco, etc. Una vez acabado con las unidades lógicas se continúa con el resto de particiones primarias que queden.

 ``Veamos un ejemplo sobre esto. Un usuario tiene un único disco duro dividido en una partición primaria (C:) y un volumen lógico en una partición extendida (D:). Ahora este mismo usuario compra un segundo disco duro y lo instala, creando en el otra partición primaria y otra partición extendida, conteniendo otro volumen lógico. Pues bien, después de encender el ordenador, la partición primaria del segundo disco se llama (D:). El volumen lógico del primer disco, que antes se llamaba D pasa a llamarse (E:) y por fin, el volumen lógico del segundo disco recibe el nombre de (F:).``

Este tipo de cambios era/es muy peligroso, ya que al cambiar los nombres de las unidades es muy probable que muchos programas dejen de funcionar. Indicar que puesto que las unidades de CD reciben el nombre las ultimas, si este usuario
instalase ahora un lector de CD, recibiría el nombre de (G:). Las unidades de CD no *suelen* tener problemas asociados a los nombres / rutas de los ficheros que los contienen ya que incluyen rutas relativas.

Este problema ocasionado por los sistemas operativos antiguos de Microsoft DOS y Windows 98 no está presente en los sistemas operativos modernos de Microsoft. Así, por ejemplo, desde Windows XP se asigna a cada unidad una letra según lo que hemos visto anteriormente, pero si se encuentra con una unidad que ya ha recibido nombre, no lo cambia.

Linux por su parte no presenta problemas de este tipo, ya que no asigna letras a los volúmenes, en su lugar tenemos que montar cada volumen en una directorio de nuestro árbol de directorios, por lo que no le afectan los problemas de nominación de volúmenes.

Hay que tener mucho cuidado al trabajar con las particiones. La tabla *MBR* es una tabla muy sensible a cualquier tipo de cambios. Una mala elección de cualquiera de sus campos, puede llevar a la inutilización total del disco duro.

Además, dada la facilidad para “trastear” con la tabla de particiones, muchos programas utilizan configuraciones extrañas que son desconocidas para otros programas, lo que puede llevar a perder particiones o a cambiar su tamaño de modo incorrecto.

\newpage
## Secuencias de arranque

### Arranque de Windows XP/2000/2003

 1. Se carga y ejecuta el **POST**
 2. Se carga el *MBR* del disco duro
 3. Se carga el sector de arranque de la partición primaria activa
 4. Se carga el programa *NTLDR*
 5. *NTLDR* ajusta el procesador para trabajar a 32 bits
 6. *NTLDR* lee el fichero BOOT.INI y muestra un menú si es necesario
 7. El usuario selecciona un sistema operativo del menú, o se carga por defecto uno de ellos
 8. *NTLDR* carga *NTDETECT.COM*
 9. NTDETEC.COM genera la lista de hardware. Devuelve el control a *NTLDR*
 10. *NTLDR* carga *NTOSKRNL.EXE*
 11. *NTOSKRNL.EXE* lee el registro de Windows, y procede a ir cargando el sistema completo.

*NTOSKRNL.EXE* como indica es en gran parte el kernel o núcleo del sistema operativo, y es un programa de gran tamaño que se encuentra normalmente en nuestro directorio Windows. Sin embargo, tanto *NTLDR*, como boot.ini o *NTDETECT.COM* son programas pequeños. Esto permite que podemos situar dichos ficheros en un disquete, llavero usb, etc, con lo que tendríamos un volumen de INICIO, lo que nos permitiría iniciar el sistema aunque el disco duro haya sufrido algún problema. Sin embargo, no se puede confundir este “disco de inicio” con un “disco de arranque”. Cuando llegue el momento de cargar *NTOSKRNL.EXE* si no se encuentra, el sistema se detendrá y no arrancará, y por el tamaño de dicho fichero y de todos los que necesita para trabajar, es imposible copiarlo en un volumen si no es de gran tamaño.

Es **importante** conocer esta secuencia, para comprender los distintos errores que se pueden
cometer y con los que nos podemos encontrar. Por ejemplo, si recibimos el mensaje “falta *NTLDR*” al intentar arrancar, está claro que se ha producido un error en el punto 4, lo que nos indicaría que se ha leído el *MBR*, el sector de arranque, y no se ha encontrado en el raíz de nuestro volumen el fichero *NTLDR*, bien porque lo hayan borrado o por que se haya borrado todo el volumen.
Sin embargo, un mensaje “falta *NTOSKRNL.EXE*” nos indicaría que si existe un fichero *NTLDR*, pero que en nuestro directorio de Windows no se ha encontrado un fichero *NTOSKRNL.EXE*.

\newpage
### Arranque de Windows vista/2008/siete
La secuencia de arranque de Windows Vista, Windows 2008 y Windows 7 es distinta de anteriores versiones de Windows. La principal diferencia estriba en que se ha cambiado el gestor de arranque, ya no se usa el *NTLDR* sino que se usa el Windows Boot Manager (bootmgr).
Mientras que el gestor *NTLDR* usaba un fichero de texto denominado boot.ini para configurar sus opciones, bootmgr utiliza una base de datos conocida como Boot Configuration Data (*BCD*) que no puede ser editada directamente como lo era el boot.ini ya que no es un fichero de texto.

El *BCD* es una base de datos con datos sobre la configuración del arranque que se suele almacenar en Bootcd.

1. Se carga y ejecuta el **POST**
2. Se carga el *MBR* del disco duro (si es la opción elegida en la **BIOS**)
3. Se carga el sector de arranque de la partición primaria activa
4. Se carga el programa bootmgr.
5. bootmgr ajusta el procesador para trabajar a 32 bits o 64 bits.
6. bootmgr lee la base de datos *BCD* y muestra un menú si es necesario
7. El usuario selecciona un sistema operativo del menú, o se carga por defecto uno de ellos
8. bootmgr carga winload.exe.
9. Winload.exe carga *NTOSKRNL.EXE* (Núcleo del sistema operativo o Kernel).
10. *NTOSKRNL.EXE* lee el registro de Windows, y procede a ir cargando el sistema completo. Windows dispone de un comando para configurar esta base de datos *BCD*, el bcedit.exe.

\newpage
### Arranque de un Linux. Ubuntu.

Linux no cuenta con un gestor de arranque propio, sino que permite usar cualquier gestor de arranque que deseemos. El que se suele incluir actualmente en todas las versiones de Linux es el *GRUB*.

El GRand Unified Bootloader (*GRUB*) es un gestor de arranque múltiple que se usa comúnmente para iniciar dos o más sistemas operativos instalados en un mismo ordenador. Otros gestores de arranque usados en Linux son el syslinux y el lilo.

Su proceso de inicio es el siguiente:

1. La **BIOS** busca un dispositivo de inicio (como el disco duro) y pasa el control al registro maestro de inicio (Máster Boot Record, *MBR*, los primeros 512 bytes del disco duro).
2. El *MBR* contiene la fase 1 de *GRUB*. Como el *MBR* es pequeño (512 bytes), la fase 1 sólo carga la siguiente fase del *GRUB* (ubicado físicamente en cualquier parte del disco duro). La fase 1 puede cargar ya sea la fase 1.5 o directamente la 2
3. *GRUB* fase 1.5 está ubicada en los siguientes 30 kilobytes del disco duro. La fase 1.5 carga la fase 2.
4. *GRUB* fase 2 (cargada por las fases 1 ó 1.5) recibe el control, y presenta al usuario el menú de inicio de *GRUB*. Este menú se configura mediante la ejecución de unos scripts situados en /etc/grub.d y que acaban generando el fichero de grub.cfg que configura la imágen.
5. *GRUB* carga el kernel (núcleo) seleccionado por el usuario en la memoria y le pasa el control para que cargue el resto del sistema operativo.

 *GRUB* no es en realidad un gestor de arranque para Linux, sino un gestor de arranque para cualquier sistema operativo. De hecho, *GRUB* es perfectamente capaz de arrancar cualquier sistema operativo de la familia Windows sin ningún tipo de problemas

### Recuperaciones de errores en el arranque

El proceso de arranque es un concepto al que el administrador de sistemas debe prestarle mucha atención, dado que el más mínimo problema que se origine en dicho proceso, hará imposible que el sistema operativo arranque, y por lo tanto dejara inservible el sistema informático.

Las zonas que hay que vigilar y conocer cómo recuperar si es necesario, son el MBR, el sector de arranque de la partición primaria activa y el programa gestor de arranque que este situado en dichas zonas.

*¿Pero, que errores se pueden producir en el arranque?*

En primer lugar debemos hablar de los fallos de hardware. Al usar un disco duro siempre existe la posibilidad de que se corrompan clústeres del mismo. Normalmente estos errores no suelen tener demasiada importancia, pero si se da la casualidad de que se corrompe el primer clúster del disco duro, que es donde se sitúa el sector del MBR y el primer sector de arranque de la primera partición, nos vamos a encontrar en serios problemas. Normalmente en estos casos lo mejor es cambiar el disco duro completo, e intentar recuperar la información que existía en el disco duro con algún programa de recuperación de datos profesional.


En segundo lugar nos encontramos la acción del malware (virus, gusanos, troyanos, etc.). Estas amenazas pueden borrar el MBR y los sectores de arranque, y antiguamente existían bastantes virus que se dedicaban a realizar estas acciones. Hoy en día, y con la *profesionalizacion* de los desarrolladores de malware, estas prácticas han quedado relegadas al
olvido.

La tercera causa, y la que suele ser culpable en el 99% de los casos, es que directamente el usuario estropee el arranque de un sistema operativo, simplemente instalando un segundo operativo.

Veamos con detalle esta situación:
Hemos visto como cada sistema operativo cuenta con su propio programa para instalar en el MBR, su propio programa para instalar en el sector de arranque, y también cuentan con su propio gestor de arranque. Está claro que si instalamos en un mismo disco duro tres sistemas operativos distintos, cada uno de ellos habrá ido instalando su propio
proceso de arranque, pero como solo puede existir un proceso de arranque en un disco duro (sólo existe un MBR) el proceso de arranque que se quede al final será el del ultimo sistema operativo instalado, que machacará el proceso de arranque del sistema operativo anteriormente instalado, y así sucesivamente.

Imaginemos el caso siguiente: En un disco duro tenemos instalado una partición con Windows XP

![problemas MBR](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/MBR_3.PNG)

En el MBR tendremos instalado evidentemente el gestor de arranque de XP y en la partición de Windows XP tendremos instalado los archivos que necesita el gestor de arranque de XP para funcionar.

Decidimos instalar en dicho disco duro una distribución de Linux como Debian, para lo cual le creamos una partición y procedemos a instalar dicho sistema operativo:
Durante este proceso de instalación, Debian instalar en el MBR el gestor de arranque de Debian (en este caso grub), y por lo tanto machacará al gestor de arranque de XP que estaba anteriormente instalado en el MBR.

![problemas MBR 2](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_02/GestorDeArranque/MBR_4.PNG)

La próxima vez que iniciemos la máquina, se cargará el gestor de arranque de *GRUB*, no el anterior que teníamos de XP. ¿Reconocerá el gestor de arranque de grub que en el disco duro existe un Windows XP y nos permitirá arrancar desde el, aparte de arrancar desde Debian? **Pues en este caso sí**.

En el mundillo de los gestores de arranque, es conveniente recordar siempre estas reglas:

 1. *GRUB* es capaz de arrancar cualquier sistema operativo, por lo que respetará siempre (o al menos lo intentará) cualquier sistema operativo que hubiera en disco duro antes de que se instalara dicho gestor de arranque.
 2. Los gestores de arranque de Windows nunca respetarán a Linux. De hecho, el gestor de arranque de Windows solo es capaz de arrancar automáticamente a sistemas operativos Windows, siendo muy complicado conseguir arrancar otros sistemas operativos no de Microsoft. Esto cambia bastante con la EFI, pero no simplifica la situación, ya que el soporte de EFI en LinuX todavia está en un estado temprano.
 3. Los gestores de arranque de Windows respetan a los sistemas operativos Windows pero solo a los anteriores a dicho Windows. Es decir, Windows 7 reconoce y respeta a Windows XP, pero al contrario no, ya que cuando se creó el gestor de arranque de XP el sistema operativo Windows 7 no existía, y por lo tanto dicho gestor de arranque de XP no lo reconocerá como un SO legítimo, y por lo tanto se negará a arrancarlo de forma automática. Veremos que 10 *ve* a Windows 7 y a Windows 8.1 pero no a la inversa, ya que se trata de sistemas operativos que no existian cuando ellos fueron lanzados.
