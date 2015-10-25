\newpage

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

## Elección del Sistema Operativo

En este punto en el que estamos el programa que está en la CPU es el POST, y ya ha concluido todo su trabajo. Pero si dicho programa simplemente liberará la CPU, el equipo se quedaría colgado ya que ningún otro software entraría en el microprocesador. Por ello, la última misión del POST es buscar otro programa, y cargarlo en la CPU antes de liberarla.
En un sistema informático actual podemos tener múltiples discos duros, cada uno de ellos con varias particiones donde pueden estar almacenados varios sistemas operativos, podemos tener un CD en la unidad lectora que también cuente con su propio sistema operativo, podemos tener un disquete de inicio en la disquetera, podemos tener un pequeño sistema operativo en
un dispositivo USB, podemos tener un disco duro externo conectado por FireWire;   etc.   ¿Cómo   puede   saber   el   POST   a   cuál   de   todos estos programas cederle el control?

De momento, en la BIOS de casi todos los equipos modernos es posible encontrar unas opciones que indican cual es el soporte de información desde el cual se va a arrancar el sistema (Boot).
Normalmente   estas   opciones   se   encuentran   en   la   segunda   opción   que aparece en el menú de la BIOS (opciones avanzadas de la BIOS ó Advanced BIOS Features).

En alguna opción de la BIOS, normalmente se nos permite indicar varios dispositivos ordenados que utilizaremos para el arranque. Una opción que se puede dejar por defecto, es indicar que se arranque desde el Floppy (*Disquetera*) si existe, luego desde el CD, y por fin del HDD, para que nos permita arrancar el sistema desde disquete, si no existe desde CD, y si tampoco hay ningún CD de arranque, desde el disco duro.

En las BIOS más modernas, veremos que también podemos indicarle que arranque desde un puerto USB, desde un puerto SATA, etc.
Sin   embargo,   es   posible   que   en   disco   duro   tengamos   varios   sistemas operativos para arrancar en nuestra maquina en varias particiones. Además, podemos tener varios discos duros en nuestro sistema, y en cada disco podemos tener varios sistemas operativos instalados.

Desde la BIOS vemos cómo podemos indicar de qué dispositivo queremos arrancar. Podemos indicar normalmente si queremos arrancar desde el disco duro, desde el CD, USB, etc.

Hay BIOS desde donde se puede indicar incluso desde cuál de los discos duros queremos arrancar (HDD- 0, HDD-1, etc.) Hay que tener en cuenta que en algunas BIOS esta facilidad para distinguir entre los distintos discos duros no está presente, o no funciona bien. En los casos en que esto ocurra, tendremos que introducirnos en la BIOS y desactivar los discos duros de los   que   no   queremos   que   arranque.   Así,   por   ejemplo,   en   un   sistema informático de dos discos duros si queremos arrancar desde el primer disco duro   no   tenemos   que   hacer   nada   pero   si   queremos   arrancar   desde   el segundo disco duro desactivaremos el primero en la BIOS.

Para desactivar los discos duros, hay que entrar en la primera opción de la BIOS y poner None, not instaled, o algo parecido en el tipo de disco duro que queremos desactivar. Esto no quiere decir que dichos discos duros no se usarán durante el funcionamiento normal de la máquina, sino que no se usarán en el proceso de arranque.

Pero con esto conseguimos indicar al sistema informático que disco duro quiero utilizar para el arranque del sistema... pero resulta que en un solo disco duro puedo tener instalado más de un sistema operativo.



¿Cómo se le indica al sistema que quiero arrancar con Windows XP, o con
Linux, o con Beos si todos estos SO están instalados en el mismo disco
duro?
Para entender esto tenemos que comprender bien como está organizado un
disco duro.
Organización lógica de un disco duro.
La estructura lógica de los discos duros es la siguiente:
1.
Tienen una tabla de particiones en el primer sector.
2.
Pueden crearse de una a cuatro particiones.
3.
Cada partición tiene su propio sector de arranque.
Las   particiones   son   divisiones   lógicas   efectuadas   en   un   disco   duro.
Responden   a   una   necesidad
muy     importante     en
informática:   compartir   un
mismo disco duro para varios
sistemas   operativos.   Cada
partición tiene la estructura
lógica correspondiente a su
sistema   operativo.   Una
partición   de   Windows   98
contiene sector de arranque,
FAT, directorio raíz y área
de   datos,   una   partición
NTFS   tiene   su   sector   de
arranque   y   MFT,   etc.   Los
datos de una partición no se mezclan con los de otra.
En un disco duro podemos tener hasta 4 particiones como máximo. De las 4,
solo una puede estar definida como activa al mismo tiempo. Esta partición
TEMA 4
Página.
12
Prácticas comunes en los Sistemas Operativos.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
activa será la que cargue el sistema operativo cuando iniciamos el sistema
informático.
En el primer sector de todo disco duro no se sitúa un sector de arranque
(puede haber un sector de arranque por cada partición, por lo que es posible
que en un disco duro existan 4 sectores de arranque), en su lugar se sitúa
una   tabla   de   particiones   (Master   Boot   Record   o   MBR).   Esta   tabla   de
particiones incluye una tabla donde definimos las 4 particiones que pueden
estar presentes en nuestro disco duro y un pequeño programa que permite
localizar   la   partición   activa,   leer   su   sector   de   arranque   y   usarlo   para
arrancar nuestro sistema informático.
Este MBR (Master Boot Record) está situada en el primer sector del disco
duro,   de  modo  que   su tamaño  es de  512 bytes.  En  esta capacidad  se
almacena lo siguiente por cada MBR:
Vemos como existe un programa al principio conocido como programa MBR o
gestor de arranque que ocupa 445 Bytes.
Un programa MBR estándar, leerá la tabla de particiones y escogerá de cual
de esas particiones va a arrancar el sistema operativo. No lo hará como
podría parecer lógico de la primera partición, sino de la partición primaria
que esta marcada como activa. El MBR lee el primer sector de esa partición,
y le cede el control de la CPU a ese programa (Boot Sector).
Hay que indicar que no existe un programa MBR estándar. En realidad, el
código que se encuentra aquí, puede ser muy variado, aunque normalmente
todos son compatibles. Podemos instalar programas MBR conocidos como
gestores de arranque que amplían las posibilidades el gestor de arranque
MBR instalado por defecto.
Hay que prestar atención a lo que se ha dicho. Si se arranca desde un disco
duro, se lee el primer sector (MBR) y este a su vez, lee un segundo sector
(Boot   Sector).Vemos   también   como   existen   4  entradas   para   almacenar
TEMA 4
Página.
13
Prácticas comunes en los Sistemas Operativos.
Dirección.
Contenido.
Tipo.
+000h
Programa MBR.
445 Bytes.
+1BEh
1º  entrada  de  la  tabla  de
particiones
16 Bytes
+1CEh
2º  entrada  de  la  tabla  de
particiones
16 Bytes
+1DEh
3º  entrada  de  la  tabla
de
particiones
16 Bytes
+1EEh
4º  entrada  de  la  tabla  de
particiones
16 Bytes
+1FEh
Identificación (AA55h)
2 Bytes
Contenido del Master Boot Record o MBR.
Longitud = 200h = 512 Bytes.
El código AA55h marca este sector como ejecutable.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
hasta 4 particiones. De aquí viene el límite de 4 particiones para un disco
duro. Por cada una de estas entradas de 16 Bytes se almacena lo siguiente:
Vemos el  1
er
campo que se usa para indicar si esta partición es la activa o no.
El 2º y 3º campo se usan para indicar el cilindro, sector y cabeza donde
comienza la partición.
El 4º campo se usa para almacenar el tipo de la partición, aquí se indica que
sistema operativo esta instalado en la partición, si dicha partición esta
oculta o no, etc.
El 5º y 6º campo se usan para indicar el cilindro, sector y cabeza donde
termina la partición.
El 7º campo indica la dirección del primer sector de la partición (el sector
de   arranque)   para   que   el   POST   pueda   pasarle   el   control.   Este   sector
siempre es el 1º sector de la partición, pero aquí indicamos su valor director
(nº de sector) y no la combinación cilindro, sector y cabeza. Esto se hace
para que el acceso al sector de arranque sea más rápido, y para evitar
posibles errores en la carga del sistema.
El 8º campo se usa para almacenar el número total de sectores que existen
en la partición. Es un campo que se usa para comprobar que los datos de la
partición son correctos.
Las particiones de un disco duro pueden ser de dos tipos:
1.
Primarias
2.
Extendidas.
En un disco duro puede haber 4 particiones como máxima, lo que implica que
puede haber 4 particiones primarias como máximo. Sin embargo, no puede
TEMA 4
Página.
14
Prácticas comunes en los Sistemas Operativos.
Dirección.
Contenido.
Tipo.
+00h
Estado de la partición:
00h
–
 Inactiva
80h
–
 arranque (activa)
1 Byte
+01h
Cabeza de lectura / escritura donde comienza la partición.
1 Byte
+02h
Sector y cilindro do
nde comienza la partición.
2 Bytes
+04h
Tipo de partición:
00h
–
 Libre
01h
–
 DOS con la vieja FAT de 12 bits.
02h
–
 XENIX
03h
–
 XENIX
04h
–
 DOS con FAT 16
05h
–
 Partición extendida.
06h
–
 Partición DOS > 32 Megas.
0Bh
–
 Windows FAT32
0Ch
–
 Windows FAT 32
LBA
0Eh
–
 VFAT
16h
–
 Hidden FAT 16 (Oculta)
63h
–
 Unix
65h
–
 Novell Netware
Etc.....
1 Byte
+05h
Cabeza de lectura / escritura donde termina la partición.
1 Byte
+06h
Sector y cilindro donde termina la partición.
2 Bytes
+08h
Dirección del primer sector
 de la partición. (Sector de arranque).
4 Bytes
+0Ch
Número de sectores en esta partición.
4 Bytes
Contenido de cada una de las 4 entradas de la tabla de particiones.
Longitud = 10h = 16 Bytes.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
oficialmente por la propia Microsoft, y existen multitud de programas de
terceras compañías que permiten retocar esta
 tabla de particiones. (No es
recomendable el uso de dichas herramientas pues pueden estropear la tabla,
y suelen dar problemas a la larga). En la familia Windows 2008, Vista,
Windows 7 encontramos también una herramienta de línea de comandos que
permite gestionar las particiones, diskpart.exe.
Linux por su parte incluye varios programas de este tipo, como pueden ser
fdisk, qtparted, parted, etc.
Los Windows modernos (a partir de ahora les llamaremos Windows de la
familia NT, o Windows NT) permiten indicar que letra de unidad se le
asignará a cada partición, sin embargo DOS y Windows 95/98 asignaban
estas letras por defecto. Primero, la C: es asignada a la partición primaria
del primer disco donde se encuentre un sistema de ficheros FAT. Entonces
la siguiente letra es asignada a la partición primaria con FAT del segundo
disco, etc. Una vez acabadas con las particiones primarias de cada disco, se
empiezan a asignar letras a las unidades lógicas del primer disco, luego a las
unidades lógicas del segundo disco, etc. Una vez acabado con las unidades
lógicas se continúa con el resto de particiones primarias que queden.
Veamos un ejemplo sobre esto. Un usuario tiene un único disco duro dividido
en una partición primaria (C:) y un volumen lógico en una partición extendida
(D:). Ahora este mismo usuario compra un segundo disco duro y lo instala,
creando   en   el   otra   partición   primaria   y   otra   partición   extendida,
conteniendo   otro   volumen   lógico.   Pues   bien,   después   de   encender   el
ordenador, la partición primaria del segundo disco se llama (D:). El volumen
lógico del primer disco, que antes se llamaba D pasa a llamarse (E:) y por fin,
el volumen lógico del segundo disco recibe el nombre de (F:). Este tipo de
cambios era muy peligroso, ya que al cambiar los nombres de las unidades es
muy probable que muchos programas dejen de funcionar. Indicar que puesto
que las unidades de CD reciben el nombre las ultimas,  si este usuario
instalase ahora un lector de CD, recibiría el nombre de (G:).
Este   problema   ocasionado   por   los   sistemas   operativos   antiguos   de
Microsoft DOS y Windows 98 no está presente en los sistemas operativos
moderno de Microsoft. Así, por ejemplo, Windows XP asigna a cada unidad
una letra según lo que hemos visto anteriormente, pero si se encuentra con
una unidad que ya ha recibido nombre, no lo cambia.
Linux por su parte no presenta problemas de este tipo, ya que no asigna
letras a los volúmenes, en su lugar tenemos que montar cada volumen en una
directorio de nuestro árbol de directorios, por lo que no le afectan los
problemas de nominación de volúmenes.
TEMA 4
Página.
17
Prácticas comunes en los Sistemas Operativos.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
Hay que tener mucho cuidado al trabajar con las particiones. La tabla MBR
es una tabla muy sensible a cualquier tipo de cambios. Una mala elección de
cualquiera de sus campos, puede llevar a la inutilización total del disco duro.
Además,   dada   la  facilidad   para   “trastear”   con   la   tabla   de   particiones,
muchos programas utilizan configuraciones extrañas que son desconocidas
para otros programas, lo que puede llevar a perder particiones o a cambiar
su tamaño de modo incorrecto.
 Arranque de Windows XP/2000/ 2003
1.
Se carga y ejecuta el POST
2.
Se carga el MBR del disco duro
3.
Se carga el sector de arranque de la partición primaria activa
4.
Se carga el programa NTLDR
5.
NTLDR ajusta el procesador para trabajar a 32 bits
6.
NTLDR lee el fichero BOOT.INI y muestra un menú si es necesario
7.
El usuario selecciona un sistema operativo del menú, o se carga por
defecto uno de ellos
8.
NTLDR carga NTDETECT.COM
9.
NTDETEC.COM genera la lista de hardware. Devuelve el control a
NTLDR
10.
NTLDR carga NTOSKRNL.EXE
11.
NTOSKRNL.EXE lee el registro de Windows, y procede a ir cargando
el sistema completo.
NTOSKRNL.EXE como indica es en gran parte el kernel o núcleo del sistema
operativo, y es un programa de gran tamaño que se
encuentra normalmente en nuestro directorio Windows.
Sin embargo, tanto ntldr, como boot.ini o ntdetect.com
son programas pequeños.
Esto permite que podemos situar dichos ficheros en
un disquete, llavero usb, etc, con lo que tendríamos un
volumen de INICIO, lo que nos permitiría iniciar el
sistema   aunque   el   disco   duro   haya   sufrido   algún
problema. Sin embargo, no se puede confundir este
“disco de inicio” con un “disco de arranque”. Cuando
llegue el momento de cargar NTOSKRNL.EXE si no se
TEMA 4
Página.
18
Prácticas comunes en los Sistemas Operativos.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
encuentra, el sistema se detendrá y no arrancará, y por el tamaño de dicho
fichero y de todos los que necesita para trabajar, es imposible copiarlo en
un volumen si no es de gran tamaño.
Es   importante   conocer   esta   secuencia,   para
comprender   los   distintos   errores   que   se   pueden
cometer y con los que nos podemos encontrar. Por
ejemplo,   si   recibimos   el   mensaje   “falta   ntldr”   al
intentar arrancar, está claro que se ha producido un
error en el punto 4, lo que nos indicaría que se ha leído
el MBR, el sector de arranque, y no se ha encontrado
en el raíz de nuestro volumen el fichero ntldr, bien porque lo hayan borrado
o por que se haya borrado todo el volumen.
Sin embargo, un mensaje “falta ntoskrnl.exe” nos indicaría que si existe un
fichero   ntldr,   pero   que   en   nuestro   directorio   de   Windows   no   se   ha
encontrado un fichero NTOSKRNL.EXE.
Arranque de Windows vista/2008/siete
La secuencia de arranque de Windows Vista, Windows 2008 y Windows 7 es
distinta de anteriores versiones de Windows. La principal diferencia estriba
en que se ha cambiado el gestor de arranque, ya no se usa el ntldr sino que
se usa el Windows Boot Manager (bootmgr).
Mientras que el gestor ntldr usaba un fichero de texto denominado boot.ini
para configurar sus opciones, bootmgr utiliza una base de datos conocida
como Boot Configuration Data (BCD) que no puede ser editada directamente
como lo era el boot.ini ya que no es un fichero de texto.
El BCD es una base de datos con datos sobre la configuración del arranque
que se suele almacenar en \Boot\Bcd.
1. Se carga y ejecuta el
POST
2. Se carga el
MBR
del disco duro (si es la opción elegida en la BIOS)
3. Se carga el
sector de arranque
de la partición primaria activa
4. Se carga el programa
bootmgr.
5. bootmgr ajusta el procesador para trabajar a 32 bits o 64 bits.
6. bootmgr lee la base de datos
BCD
y muestra un menú si es necesario
TEMA 4
Página.
19
Prácticas comunes en los Sistemas Operativos.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
7. El usuario selecciona un sistema operativo del menú, o se carga por
defecto uno de ellos
8. bootmgr carga
winload.exe.
9. Winload.exe carga  
NTOSKRNL.EXE
(Núcleo del sistema operativo o
Kernel).
10. NTOSKRNL.EXE lee el
registro
de Windows, y procede a ir cargando el
sistema completo.
Windows dispone de un comando para configurar esta base de datos BCD, el
bcedit.exe
,   pero   es   realmente   engorroso   de   usar.   Es   mejor   usar   una
utilidad grafica de una 3rd party (tercera compañía, una compañía distinta a
la que realiza el sistema) como puede ser EasyBCD que permite configurar
muchas más opciones que el bcedit.exe y de forma mucho más fácil.
Arranque de un Linux. Ubuntu.
Linux no cuenta con un gestor de arranque propio, sino que permite usar
cualquier   gestor   de   arranque   que   deseemos.   El   que   se   suele   incluir
actualmente en todas las versiones de Linux es el GRUB.
El GRand Unified Bootloader (GRUB) es un gestor de arranque múltiple que
se usa comúnmente para iniciar dos o más sistemas operativos instalados en
un mismo ordenador. Otros gestores de arranque usados en Linux son el
syslinux y el lilo.
Su proceso de inicio es el siguiente:
1.
La BIOS busca un dispositivo de inicio (como el disco duro) y pasa el
control al registro maestro de inicio (Máster Boot Record, MBR, los
primeros 512 bytes del disco duro).
2.
El MBR contiene la fase 1 de GRUB. Como el MBR es pequeño (512
bytes), la fase 1 sólo carga la siguiente fase del GRUB (ubicado
físicamente en cualquier parte del disco duro). La fase 1 puede cargar
ya sea la fase 1.5 o directamente la 2
3.
GRUB fase 1.5 está ubicada en los siguientes 30 kilobytes del disco
duro. La fase 1.5 carga la fase 2.
TEMA 4
Página.
20
Prácticas comunes en los Sistemas Operativos.
IMPLANTACIÓN DE SISTEMAS OPERATIVOS
4.
GRUB fase 2 (cargada por las fases 1 ó 1.5) recibe el control, y
presenta   al   usuario   el   menú   de   inicio   de   GRUB.   Este   menú   se
configura mediante un fichero de texto con nombre menu.lst.
5.
GRUB   carga   el   kernel   (núcleo)   seleccionado   por   el   usuario   en   la
memoria y le pasa el control para que cargue el resto del sistema
operativo.
GRUB no es en realidad un gestor de arranque para Linux, sino un gestor de
arranque   para   cualquier   sistema   operativo.   De   hecho,   GRUB   es
perfectamente capaz de arrancar cualquier sistema operativo de la familia
Windows sin ningún tipo de problemas
