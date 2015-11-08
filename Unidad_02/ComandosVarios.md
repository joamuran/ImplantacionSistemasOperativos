\newpage


Comando sort
El comando sort ordena las líneas de un fichero mostrándolas por la salida estándar. De no
especificarse un fichero toma la entrada estándar.
Sintaxis sort [opciones] [fichero]
Algunas opciones:
-r : ordena al revés.
-f : trata las mayúsculas y minúsculas por igual.
-g : ordena de forma numérica, de modo que no es necesario que los números
se rellenen con ceros por la izquierda.
Ejemplo: $ sort -f /etc/passwd
Como ejercicio, cread un archivo llamado lista-desordenada con el vi y meter dentro 5 nombres
desordenados. Comprobad como con la orden sort lista-desordenada > lista-ordenada creamos un
fichero llamado lista-ordenada y que contiene la lista ordenada.
Comando uniq
El comando uniq elimina las líneas repetidas de un fichero ordenado, imprimiéndolo por la salida
estándar o en otro fichero argumento. De no especificarse un fichero toma la entrada estándar.
Sintaxis uniq [opciones] [fichero] [salida]
Algunas opciones:
-c : utiliza como prefijo en cada línea su número de ocurrencias.
-d : solo imprime las líneas duplicadas.
Ejemplo: $ uniq -d lista.txt
 Comandos tail y head
Los comandos tail y head muestran respectivamente el final y el comienzo (10 líneas por defecto)
de uno o varios ficheros. De no especificarse al menos un fichero toman la entrada estándar.
Sintaxis
tail [opciones] [ficheros]
head [opciones] [ficheros]
Algunas opciones:
 *  -f para el caso de tail se ejecuta de forma sostenida o sea se continúa visualizando el final del
fichero hasta que se interrumpa el proceso (Ctrl-c).
 *  -q no coloca los encabezamiento con el nombre de los ficheros cuando se indican varios (quiet).
 *  -<n> imprime las n últimas (primeras) líneas en lugar de las diez establecidas por defecto.
### Ejemplos


 # tail -f /var/log/messages
 # tail -20 /var/log/secure
 # head -50 /var/spool/mail/pepe
 # head -2 -q /etc/*.conf
 Comando wc
El comando wc imprime el número de líneas, palabras y bytes de uno o varios ficheros. Si son varios
ficheros hace también un resumen de los totales. De no especificarse un fichero toma la entrada
estándar.
Sintaxis wc [opciones] [ficheros]
Algunas opciones:
 *  -l sólo cuenta líneas.
 *  -c sólo cuenta bytes.
 *  -w sólo cuenta palabras.
### Ejemplos
 $ wc -l /etc/passwd
 $ wc -w /doc/dicciorario.txt
Comando cut
El comando cut nos permite cortar una línea de texto, para obtener un subconjunto en lugar de la
línea completa. Podemos cortar por número de caracteres, por campos, etc.
Sintaxis cut [opciones] [ficheros]
Algunas opciones:
 *  -c N-M corta desde el carácter número N hasta el carácter número M.
 *  -c N- corta desde el carácter número N hasta el final
 *  -c –N corta desde el principio hasta el carácter número N
 *  -c N,M corta el carácter número N y el carácter número M
 *  -d”:” –f1 separa la línea en campos divididos por el carácter : y nos muestra sólo el primer
campo
 -d”-“ –f3 separa la linea en campos divididos por el carácter – y nos muestra sólo el 3 campo.
### Ejemplos
 $ cut –c 3-9 /etc/passwd
 $ cut –c d”:” –f4 /etc/passwd



## gzip y gunzip
Los comandos gzip y gunzip permiten compactar y descompactar (comprimir y descomprimir)
respectivamente uno o varios ficheros.
Sintaxis
gzip [opciones] <ficheros/directorio>


gunzip [opciones] <ficheros/directorio>
Algunas opciones:
 *  -r : dado un directorio comprime todos los ficheros presentes en él recursivamente.
 *  -1 a -9 : especifica el grado de la compresión (-1 menor y más rápida -9 mayor y más lenta).
 *  -S <sufijo> : permite especificar un sufijo o extensión para el fichero resultado (por defecto es
gz).
### Ejemplos
$ gzip -9 * # Comprime todos los ficheros del directorio actual (su
extensión cambia a .gz)
 $ gunzip big-file.gz # descomprime el fichero big-file.gz
Todo lo compactado con gzip se puede descompactar con el Winzip de los sistemas Windows.
También existen los pares de comandos zip y unzip (compatibles en ambos sentidos con Winzip), y
compress y uncompress.
Comando tar
El comando tar (Tape Archiver) es una herramienta para agrupar varios ficheros aislados o el
contenido de un directorio en otro fichero o dispositivo especial. El comando tar no comprime o
compacta absolutamente nada, se limita a agrupar varios ficheros en uno solo, sin comprimirlos.
Existe una opción (-z) que automáticamente ejecuta un gzip o un gunzip sobre el fichero agrupado.
### Sintaxis tar [opciones] <fuentes>
Algunas opciones:
 *  -c permite crear (tarear), es decir, agrupar ficheros en uno solo.
 *  -x permite extraer (destarear), es decir, desagrupar ficheros.
 *  -v activa el modo debug, donde se ven todos los mensajes.
 *  -f <fichero> agrupa o desagrupa en o hacia un fichero y no utilizando la salida o entrada
estándar como es por defecto. (Ojo, esta opción la usaremos siempre).
 *  -z compacta o descompacta el fichero resultante una vez agrupado o desagrupado con gzip y
gunzip respectivamente.
 *  -t lista el contenido de un fichero resultado de un agrupamiento.
 *  -M agrupa en volúmenes.
El comando tar conserva la estructura jerárquica original de lo agrupado excluyendo el carácter /
que representa a la raíz. Algunas opciones se pueden emplear sin el carácter -, siempre y cuando no
haya ambigüedades entre ellas o con los argumentos.
### Ejemplos


$ tar cvzf grande * # crea un fichero grande donde estarán agrupados
todos los ficheros del directorio actual y que además estará
comprimido.
$ tar xvzf grande # desagrupa en el directorio actual el fichero grande
y ademas lo descomprime.
# tar cf uconf.tar /etc/passwd /etc/shadow /etc/groups # agrupa en el
fichero uconf.tar los ficheros passwd shadow y groups
# tar tf uconf.tar # muestra los ficheros agrupados en uconf.tar
# tar xf uconf.tar # desagrupa el fichero uconf.tar
$ tar cMf /dev/fd0 /tmp/etc.tgz
$ tar xMf /dev/fd0
1.8 Comandos para desconectarse del sistema
 Comando exit
El comando exit permite terminar el shell actual. Si se tiene un único shell es equivalente a
desconectarse del sistema, pero si se está en un subshell sólo se terminará este, retornando al
shell anterior.
 Comando logout
El comando logout permite desconectarse del sistema a partir de un login shell (primer shell que se
ejecuta al establecer la conexión).
La secuencia de caracteres Ctrl-d permite terminar el shell actual. Si es un login shell equivaldrá a
hacer logout y si no, a hacer exit.
Comando halt, reboot, poweroff
Estos comandos nos permiten suspender, reiniciar o apagar el sistema.
Comando shutdown
Este comando nos permite “echar abajo” el sistema. Algunas opciones interesantes:
-c cancela un shutdown que esta en proceso de ejecución
-f Reinicia más rapido, ya que no controla la integridad de los sistemas de archivos
-h Cuando el sistema se apaga, apaga el ordenador (o lo intenta)
-r Cuando el sistema se apaga, intenta reiniciarlo
Despues de estas opciones, se le indica cuando queremos apagar el sistema:
now lo apaga inmediatamente, ahora.
20:00 lo apaga a las 8 de la tarde


+10 lo apaga en 10 minutos
# shutdown -h +4
1.9 Comandos para administrar usuarios y grupos
Comando useradd
El comando useradd permite añadir nuevos usuarios al sistema, además de establecer la información
por defecto de los nuevos usuarios que se añadan.
### Sintaxis useradd [opciones] [login]
### Ejemplos
# useradd pepe # crea el usuario pepe con todas las opciones por
defecto.
# useradd –D # muestra las opciones por defecto que se aplicarán a los
usuarios nuevos.
Comando adduser
La orden useradd no se suele usar, ya que no configura correctamente las cuentas de usuario. En su
lugar en los sistemas Linux actuales se ha creado un script denominado adduser que nos permite
crear usuarios de una forma más amistosa.
### Sintaxis adduser [opciones] [login]
 Adduser usuario grupo
### Ejemplos
# adduser pepe # crea un usuario pepe, preguntándonos por su
contraseña, comentarios, etc.
# adduser # crea un usuario, preguntandonos por su nombre, su
contraseña, comentarios, etc.
# adduser pepe cdrom # añade al usuario pepe, que debe existir ya, al
grupo cdrom.
Comando addgroup
Nos permite crear grupos.
### Sintaxis addgroup grupo
Ejemplo:
# addgroup alumnos


Comando userdel
El comando userdel permite eliminar definitivamente un usuario del sistema.
### Sintaxis userdel [opciones] <login>
Ejemplo:
# userdel -r pepe # elimina al usuario pepe y borra su directorio base.
Por defecto el directorio base se mantiene
Comando groupdel
El comando groupdel permite eliminar definitivamente un grupo del sistema.
### Sintaxis groupdel [opciones] grupo
Ejemplo:
# groupdel alumnos
Comando passwd
El comando passwd permite cambiar el password de un usuario. También puede bloquear,
desbloquear y deshabilitar una cuenta. Si se invoca sin argumentos se asume el usuario actual.
### Sintaxis passwd [opciones] [login]
### Ejemplos
 # passwd pepe # coloca una contraseña para pepe
# passwd -d pepe # deshabilita la cuenta del usuario pepe eliminando
su password
# passwd -l pepe # bloquea la cuenta del usuario pepe poniendo un
signo ! delante de su password en el fichero /etc/shadow
 # passwd -u pepe # desbloquea la cuenta del usuario pepe
Comando usermod
El comando usermod se emplea para modificar algunas propiedades de los usuarios como: el login, el
directorio base, el shell que se inicia al conectarse, los grupos a los que pertenece, la fecha de
expiración de la cuenta, etc. También bloquea y desbloquea una cuenta.
### Sintaxis usermod [opciones] <login>
### Ejemplos
# usermod -s /bin/csh pepe # coloca el shell csh para el
usuario pepe
# usermod -G users,disk pepe # señala como grupos secundarios de
pepe a users y disk
# usermod -e 2001-10-20 pepe # indica que la cuenta de pepe expirará
el 20 de octubre del 2001


Comando chfn
El comando chfn permite cambiar la información de contacto de un usuario. Esta incluye aspectos
como: el nombre completo, la oficina de trabajo y los teléfonos. Se almacena en el fichero de
usuarios /etc/passwd.
### Sintaxis chfn [opciones] [login]
Ejemplo:
 # chfn pepe
Comando gpasswd
El comando gpasswd permite administrar los grupos. Se puede utilizar para añadir y eliminar
usuarios, señalar un administrador e indicar un password de grupo.
### Sintaxis gpasswd [opciones] <grupo>
### Ejemplos
# gpasswd -A pepe admin # señala como administrador del grupo
admin al usuario pepe
 $ gpasswd admin # cambia el passwd del grupo admin
 $ gpasswd -a joe admin # añade el usuario joe al grupo admin
Comando su
El comando su permite ejecutar un shell (u otro comando) cambiando los identificadores del grupo y
del usuario actual. Si se le pasa - como primer argumento ejecuta el shell como un login shell, o sea
se creará un proceso de login tal y como ocurre naturalmente cuando un usuario se conecta al
sistema. Si no se especifica el login del usuario se asume root.
### Sintaxis su [opciones] [login]
### Ejemplos
$ su - # el guion permite abrir una shell para el usuario.
# su pepe
$ su --c "cat /etc/shadow" # ejecuta un comando con los privilegios de
root. (básicamente, realiza lo mismo que el comando sudo).
Comando sudo
En algunos sistemas, como puede ser Ubuntu, existe una orden denominada sudo, que viene a ser un
su –-c (es decir, permite ejecutar una orden como el usuario root).
### Sintaxis sudo
### Ejemplos
$ sudo gedit /etc/shadow # ejecuta gedit /etc/shadow como si lo
ejecutará el root.
$ sudo su # Nos transforma en el root hasta que escribamos exit.


$ sudo su - # Nos transforma en el root, y abre un nuevo shell para el
root.
Comando id
El comando id, imprime dado un usuario, sus identificadores de usuario y de grupo principal (gid y
uid) así como del resto de los grupos a los que pertenece. Sin argumentos se asume el usuario
actual.
### Sintaxis id [opciones] [login]
Ejemplo:
 # id pepe  uid=502(pepe) gid=502(pepe) groups=502(pepe),100(users)
Comando chage
El comando chage nos permita gestionar la información sobre la caducidad de las contraseñas.
# chage Joancadi
Comando last
El comando last nos indica las últimas conexiones de usuario que han existido en el sistema.
# last
1.10 Comandos de redes
Comando tracepath
El comando tracepath nos permite trazar una ruta entre nuestro host y el host que le indiquemos,
mostrándonos todos los pasos intermedios que va recorriendo.
# tracepath www.elpais.es
Comando write
El comando write se utiliza para enviar un mensaje a un usuario conectado al sistema. Por defecto el
mensaje se envía a la última terminal donde se haya conectado el usuario. Los usuarios pueden
deshabilitar la posibilidad de recibir mensajes utilizando el comando mesg.
### Sintaxis write <usuario> [terminal]


### Ejemplos
 $ mesg y # habilita la posibilidad de recibir mensajes
 $ write pepe tty3
 Hola que tal Ctrl-d
Si el usuario pepe está conectado a través de la terminal tty3 y tiene habilitada la posibilidad de
recibir mensajes se mostrará en esta terminal:
 Message from coco@deltha on tty2 at 16:35 ... (o el usuario que sea)
 Hola que tal EOF
$ mesg # muestra si está habilitada o no la posibilidad de recibir
mensajes
 $ mesg n # deshabilita la posibilidad de recibir mensajes
Realmente este comando es interesante cuando al menos uno de los usuarios está conectado
remotamente, a través de terminales.
Comando wall
El comando wall se emplea para enviar un mensaje a todos los usuarios conectados en el sistema que
tengan habilitada la posibilidad de recibirlos (mesg y).
### Ejemplos
 # wall
  Voy a apagar la máquina a
  las 2:00 PM
  El administrador
 Ctrl-d
Comando netstat
El comando netstat nos muestra información sobre las conexiones de red, las tablas de
enrutamiento, las estadísticas de los interfaces de red, etc. Con este comando podemos conocer
perfectamente que esta ocurriendo en nuestra red y como se comporta nuestro equipo en la misma.
# netstat -i # estadísticas de nuestras conexiones de red.
# netstat -l -t # aplicaciones que tenemos instaladas y están
“escuchando” en la red usando un puerto tcp.
# netstat -l -u # aplicaciones que tenemos instaladas y están
“escuchando” en la red usando un puerto udp.
Comando route


El comando route gestiona la tabla de enrutamientos del sistema de red. Mediante estas tablas de
enrutamiento podemos realizar poderosas acciones sobre la red, como manejar varias puertas de
enlace, trabajar en distintas redes, etc.
# route
Comando nslookup
El comando nslookup nos permite interrogar a un servidor DNS para encontrar información sobre un
host de la red.
# nslookup www.elpais.es
Comando tty
El comando tty imprime el dispositivo de carácter asociado a la terminal en la que se está
trabajando.
### Ejemplos
 $ tty  /dev/tty2
 $ tty  /dev/pts/0
Comando who
El comando who muestra los usuarios conectados al sistema ya sea local o remotamente.
### Sintaxis who [opciones] [fichero] [am i]
Sin argumentos who muestra los logins de los usuarios conectados, por que terminal lo han hecho y
en que fecha y hora.
Algunas opciones:
-H : imprime un encabezamiento para las columnas.
-w : indica si está activada o no la posibilidad de recibir mensajes por parte de cada usuario
conectado (+ indica que si, - que no y ?, desconocido).
-i : imprime además para cada usuario conectado que tiempo lleva sin interactuar con el sistema
(idle time). Si lleva menos de un minuto pone un punto y si es más de 24 horas la cadena *old*.
-q : sólo muestra los logins de los usuarios conectados y la cantidad total de ellos.
### Ejemplos
 $ who
 $ who am I


Comando w
El comando w muestra también los usuarios conectados al sistema además de lo que están haciendo
(proceso que ejecutan en ese momento) y otras informaciones.
### Sintaxis w [opciones] [usuario]
Sin argumentos este comando muestra una primera línea con: la hora en que arrancó el sistema,
cuanto tiempo lleva funcionando, cuantos usuarios hay conectados (sin incluir las sesiones gráficas)
y tres porcientos de carga de la CPU: durante el último, los 5 y los 15 minutos anteriores. A
continuación se muestra una tabla cuyas columnas representan: el login de cada usuario conectado,
por que terminal lo ha hecho, desde que host, a que hora, el idle time exacto, la cantidad de
segundos de CPU que han empleado todos los procesos que ha ejecutado ese usuario (JCPU) y el
tiempo (PCPU) y nombre del comando que ejecuta actualmente.
### Ejemplos
 $ w
 $ w pepe
Comando finger
El comando finger permite buscar y mostrar información asociada a los usuarios del sistema de
acuerdo a sus nombres, apellidos o login. La información que muestra finger para cada usuario es:
 *  El login.
 *  El nombre y los apellidos.
 *  El directorio base.
 *  El shell.
 *  La oficina y el teléfono.
 *  El teléfono de la casa.
 *  La lista de terminales a través de las que está conectado con la fecha, tiempo sin
interactuar (iddle time) y si está deshabilitada la posibilidad de recibir mensajes.
 *  La fecha y hora del último nuevo mensaje electrónico recibido y desde cuando no accede al
buzón.
 *  El contenido del fichero .plan en el directorio base.
### Ejemplos
 $ finger alina
 $ finger castellanos


Comando ping
El comando ping permite enviar paquetes ICMP (Internet Control Message Protocol) del tipo
ECHO_REQUEST a otra computadora, con el objetivo de saber si esta es alcanzable a través de la
red. Además muestra un resumen estadístico acerca del tanto por ciento de paquetes perdidos y las
velocidades de transmisión. Este comando se ejecuta por defecto sostenidamente por lo que para
interrumpirlo se debe hacer Ctrl-c.
### Sintaxis ping [opciones] <máquina>
Algunas opciones:
-c <n> : envía n paquetes exactamente.
-i <n> : espera n segundos entre los envíos.
-s <n> : envía paquetes de n bytes. Se le suman los 8 bytes del header del paquete ICMP.
-q : sólo despliega el sumario final.
### Ejemplos
 $ ping www.iesromerovargas.net
Comando ifconfig
El comando ifconfig permite configurar por parte de root las interfaces de red. Los usuarios
distintos de root lo pueden invocar también con fines informativos. Para ello deben especificar el
camino completo (/sbin/ifconfig) pues por defecto este no está en el path de los usuarios comunes.
Sin argumento ifconfig despliega información acerca de la configuración y funcionamiento actuales
de las interfaces de red activas.
### Ejemplos
# ifconfig
# ifconfig –s # Muestra un resumen de los interfaces
# ifconfig eth0 # Muestra información solo sobre el interface eth0
Ifconfig también puede usarse para activar y desactivar los interfaces de red.
# ifconfig eth0 up
# ifconfig lo down
Ifconfig puede usarse también para configurar los interfaces de red, aunque suele ser mejor
configurarlos editando el fichero /etc/network/interfaces.
# ifconfig eth0 hw ether 00:30:CA:52:0A:F0 # Cambia la dirección MAC
del interface
# ifconfig eth0 address 192.168.100.2
# ifconfig wlan0 netmask 255.255.255.0


Comando hostname y dnsdomainname
El comando hostname nos devuelve el nombre de equipo (host) y nos permite cambiarlo. El comando
dnsdomainname hace lo mismo pero para un nombre FQDN (Fully Qualified Domain Name).
# hostname
# dnsdomainname
# hostname pepito # Hace que el nombre de equipo pase a ser
pepito.
Hay que tener mucho cuidado al cambiar el nombre de equipo, ya que es muy posible que tengamos
programas y comandos que están preparados para trabajar y encontrar nuestro equipo con el
nombre actual (sudo por ejemplo). Nos podemos encontrar que estos programas funcionen mal si
cambiamos el nombre del equipo. El nombre del equipo se almacena en el fichero /etc/host.conf.
1.11 Comandos varios
Comando echo
El comando echo muestra en su salida todo lo que se le pase como argumento.
Ejemplo:
$ echo Hola amigo...
Hola amigo...
Comando set
El comando set sirve para gestionar las variables y funciones del shell. Si se ejecuta set
directamente sin parámetros, nos devuelve los nombres y valores de varias funciones del shell.
# set
En bash no es necesario asignar variables mediante set variable=valor, sino que se puede usar
directamente variable=valor. Sin embargo, nos podemos encontrar trabajando con otros shells,
como csh en los que es obligatorio usar el set para asignar valores a las variables.
Comando history
El comando history nos permite controlar el histórico de comandos que se van almacenando en el
shell. El histórico se almacena por defecto en el fichero ~/.history lo que nos indica que existe un
histórico diferenciado para cada usuario. Si ejecutamos el comando history nos devolverá la
relación de comandos para ese usuario.
# history


Una posibilidad es enviar la salida de la orden history a un fichero, con lo que conseguimos tener una
relación de los comandos que hemos ejecutado.
Comando uname
El comando uname nos da información sobre el sistema, como el nombre del kernel, su versión, el
nombre de la maquina, etc.
# uname -a
Comando date
El comando date sirve para consultar y cambiar la fecha y hora del sistema.
# date
El comando date tiene bastantes opciones, y con el se pueden hacer bastantes cosas. Es
recomendable echarle un vistazo a sus páginas de manual para entenderlos bien. Veamos algunos
ejemplos.
$ date --date=”2 days ago” # nos da la fecha de hace dos días
$ date --date=”3 months 1 day” # nos da la fecha que será en 3
meses y un día.
$ date --date=”25 Dec” # nos da el dia que será el 25 de
Diciembre del año actual
$ date “+%B %d” # nos devuelve el nombre del mes
actual y el número de día del mes.
$ date --set=”2006-6-20 11:59 AM” # ajusta la fecha del sistema
$ date --set=”+3 minutes” # adelante la hora del sistema en 3
minutos.
Comando time
El comando time sirve para cronometrar cuanto tiempo tarda en ejecutarse un comando cualquiera,
y que recursos consume. Puede ser una orden interesante para comprobar el rendimiento de los
sistemas.
# time wc /etc/passwd
Comando uptime
El comando uptime nos indica las el “uptime” del sistema. En informática se conoce como uptime el
tiempo que un equipo lleva “levantado”, es decir cuanto tiempo lleva el sistema funcionando. En un
servidor es muy importante que este uptime sea lo más elevado posible. Uptime nos devuelve cuanto
tiempo lleva el equipo levantado, el número de usuarios que están conectados, y la media de las
cargas de sistema para los últimos 1, 5, y 15 minutos.
# uptime
Comando top
El comando top nos muestra los procesos que se están ejecutando en nuestra maquina, y cuantos
recursos están ocupando. Es una orden muy interesante por que nos permite ver como se encuentra
nuestro sistema de “cargado”, que procesos son los que están consumiendo más recursos, etc. Si
pulsamos h en la pantalla de top, veremos una pantalla de ayuda donde podemos ordenar la lista de
procesos según su consumo de cpu, memoria, etc.
# top
Comando dmesg
Nos da una lista con todos los mensajes que se han producido durante el arranque del sistema.
# dmesg
