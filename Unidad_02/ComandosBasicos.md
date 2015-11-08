\newpage

# Comandos en GNU/LinuX

Existen múltiples y variadas formas de obtener ayuda en un sistema Linux.
 1. Muchos comandos poseen una opción para mostrar una ayuda breve acerca de su utilización. Esta opción usualmente es `-h`, `--help` ó `-?`.
 2. El comando `man` formatea y despliega un manual bastante amplio acerca de comandos, formatos de ficheros de configuración, llamados al sistema, etc. Los manuales están disponibles y pueden instalarse en múltiples idiomas. Estos se dividen internamente en secciones. Un mismo objetivo puede estar representado en varias secciones. De no especificarse ninguna sección a través del primer argumento del comando se tomará la primera donde aparezca.
 3. Existe un conjunto de comandos integrados (builtin) al bash que no poseen un manual propio. Para ellos se puede emplear el comando help. Si se usa man sólo se mostrará la lista de los comandos integrados. La ayuda que muestra help es un fragmento del manual de bash


## Comando ls

El comando `ls` permite listar el contenido de un directorio.

### Sintaxis

 `ls [opciones] [directorio | fichero]`

 Algunas de las opciones son:

* -l : muestra la salida en formato largo.
* -R : lista recursivamente un directorio.
* -a : lista además los ficheros ocultos (sus nombres comienzan con punto).
* -h : muestra el tamaño de los ficheros en forma más humanamente legible ( 16G, 40K, etc.)

### Ejemplos

 * `ls /tmp/`
 * `ls -la /tmp/`
 * `ls -lah ~`
 * `ls -R /etc/apt/`

\newpage
## Comando cd

El comando `cd` sirve para cambiar el directorio en el que nos encontramos.

### Sintaxis

 `cd [directorio]`

 Si lo ejecutamos sin parámetros, cd nos devuelve al directorio personal del usuario, aquél que está definido en el fichero de /etc/password o en la variable `$HOME`.

### Ejemplos

 * `$ cd ~`
 * `$ cd /etc/`
 * `$ cd ../../tmp/`
 * `$ cd /tmp/`

\newpage
## Comando pwd

El comando `pwd` nos muestra el PATH completo del directorio actual, es decir la ruta desde la raiz del sistema de ficheros. Si ejecutamos las siguientes ordenes como el usuario *violin*, nos mostrará lo siguiente.

### Ejemplos

 * `$ cd ~`
 * `$ pwd`
   `/home/violin/`

## Comando mkdir

El comando mkdir se utiliza para crear directorios.

### Sintaxis

`mkdir [opciones] rutaAlDirectorio`

Si se pasa como opción `-p` el comando creará todos los directorios que necesite para crear el destino (*PATH*).

### Ejemplos

 * `$ cd ~`
 * `$ mkdir esteNoExiste/esteEsElQueQuiero` <--- Este fallará
 * `$ mkdir -p esteNoExiste/esteEsElQueQuiero` <--- Este NO fallará y creará ambos directorios.

\newpage


## Comando mv
El comando mv mueve un fichero hacia otro, o varios ficheros hacia un directorio. Este permite a su
vez renombrar ficheros o directorios.

### Sintaxis

`mv [opciones] <origen> <destino>`

Algunas opciones:

 *  -i : ejecuta el comando de forma interactiva, o sea, pregunta ante de sobrescribir el destino si existiera.
 *  -u : actualiza (upgrade) el destino con el fuente solo si este es más reciente.

### Ejemplos

 * `$ mv -i *.txt /tmp`
 * mueve ficheros terminados en .txt al directorio /tmp

 * `$ mv -u cosasNuevas.txt src/`
 * actualiza el fichero destino si es menos reciente que el origen|

## Comando cp

El comando cp permite copiar un fichero en otro, o varios ficheros en un directorio.

### Sintaxis

 * `cp [opciones] <fuente> <destino>`
 * `cp [opciones] <ficheros> <directorio>`

Algunas opciones:

 *  -R : copia recursivamente un directorio.
 *  -i : utiliza una forma interactiva (pregunta antes de sobrescribir el destino).
 *  -l : hace enlaces fuertes a los ficheros fuentes en lugar de copiarlos.

### Ejemplos

 * `$ cp /etc/passwd . `
 * copia un fichero en el directorio actual

 * `$ cp -i /usr/bin/*sh /tmp `
 * copia interactivamente los ficheros terminados en sh en un directorio llamado /tmp|

\newpage

## Comando rm
El comando rm se utiliza para borrar (desenlazar) ficheros

### Sintaxis

`rm [opciones] <ficheros | directorios>`

Algunas opciones:
 *  -r : borra recursivamente un directorio.
 *  -f : borra forzosamente en caso de que no se tenga permiso de escritura en forma directa.
 *  -i : ejecuta el comando de forma interactiva.

### Ejemplos

* `$ touch prueba`
* `$ touch 1_cuerda 2_cuerda 3_cuerda`
* `$ mkdir temp`
* `$ rm prueba`
* `$ rm -i cuerda_*`
* `$ rm -rf temp/`

## Comando chown

El comando chown se utiliza para cambiar el dueño y el grupo de un fichero. Existe también el comando chgrp que se emplea de forma similar pero para cambiar el grupo solamente. El dueño de un fichero solo lo puede cambiar el usuario root mientras que el grupo además de root, lo puede cambiar el propio dueño, siempre que pertenezca al nuevo grupo. El tema de los permisos ya lo veremos más adelante.

El propietario y el grupo de un fichero se puede comprobar con un `ls -l`

### Sintaxis

* `chown [opciones] <dueño>[:grupo] <ficheros>`
* `chown [opciones] <grupo> <ficheros>`

Opción:

 *  -R en los directorios cambia el dueño y/o el grupo recursivamente.

### Ejemplos

 * `$ touch /tmp/estoEsDeViola`
 * `$ chown viola:viola /tmp/estoEsDeViola`
 * Cambia el propietario de /tmp/estoEsDeViola a viola y el grupo de /tmp/estoEsDeViola al grupo viola

 * `# chown -R root /tmp/oculto `
 * Cambia todos los ficheros que esten en el directorio oculto y coloca como propietario al usuario root

## Comando cat

El comando cat concatena (*conCATenate*) ficheros y los imprime en la salida estándar. Si no se le pasa ningún argumento lee de la entrada estándar. Existe también zcat que hace lo mismo pero con ficheros comprimidos. Si solo se da el origen a cat, utiliza como salida la pantalla. Es decir, cat hola muestra por pantalla el fichero hola. Si solo se da la salida a cat (cat > fichero) utiliza como entrada el teclado.

### Ejemplos

* `$ cat /etc/passwd /etc/shadow`
* `$ cat > fichero`
* `$ cat < origen > destino`

## Editor vi

El editor vi es el editor estándar de Unix y esta orientado a comandos. Existe una versión conocida como vim (Vi IMproved) muy poderosa que permite la edición de múltiples ficheros, edición automatica para varios lenguajes de programación, ayuda en línea, selección visual, varios niveles de deshacer, etc. Para algunos usuarios, vi resulta incómodo pues para utilizar todas sus potencialidades es necesario conocer muchas combinaciones de teclas, pero si se llega a dominar resulta muy funcional. Su principal virtud es que encontraremos vi en prácticamente cualquier versión de Unix que usemos, cosa que no se puede decir de otros editores (joe, pico, edit, gedit, nano, emacs, etc.).

Básicamente vi posee dos modos de interacción: el de inserción (edición) y el de comandos. Para pasar al modo comando se pulsa Esc y para pasar al de inserción se pulsa `i`.

Algunos comandos útiles en vi (pulsando ESC para pasar al modo de comandos, que veremos en la última línea de la pantalla).

 *  dd - borra la línea actual.
 *  D - borra desde la posición actual hasta el final de la línea.
 *  dG - borra hasta el final del fichero.
 *  u - deshace el último comando.
 *  :q - sale del editor (si se han hecho modificaciones y no se ha salvado se genera un error).
 *  :q! - sale sin salvar.
 *  :w - salva.
 *  :wq - salva y sale.
 *  :x - salva y sale.
 *  <n><comando> - ejecuta el comando c n veces.

## Comandos more y less

Los comandos *more* y *less* paginan (dividen en páginas) uno o varios ficheros y los muestran en la terminal (pantalla). De no indicárseles un fichero, paginan la entrada estándar (que se manda mediante una tuberia).

Se diferencian en las facilidades que brindan. Por ejemplo more es más restrictivo en cuanto al movimiento dentro del texto, mientras que less no limita este aspecto pues acepta el empleo de todas las teclas de movimiento tradicionales. Cuando se alcanza el final del último fichero a paginar, more termina automáticamente, no así less. También more muestra sucesivamente el porcentaje del fichero visto hasta el momento.

Tanto less como more proveen una serie de comandos para moverse con facilidad dentro del texto paginado.

### Ejemplos

* `$ less /etc/passwd`
* `$ more /etc/passwd`
* `$ cat fichero | less`

Algunas teclas que podemos usar mientras usamos estos programas son:

 *  q - permite interrumpir el proceso y salir.
 *  /p - realiza búsquedas del patrón p dentro del texto. Para repetir la búsqueda del mismo patrón sólo es necesario escribir /.
 *  [n]b - en more permite regresar n páginas (por defecto n es 1).
 *  [n]f - en more se adelantan n páginas y en less, n líneas.

El man, para dar formato a su salida, utiliza por defecto el paginador less. Existen además los comando zless y zmore que permiten paginar con less y more respectivamente, a los ficheros comprimidos sin necesidad de descomprimirlos previamente.

## Comando grep
El comando grep (Globally Regular Expressions Pattern) busca patrones en ficheros. Por defecto devuelve todas las líneas que contienen un patrón (cadena de texto) determinado en uno o varios ficheros. Utilizando las opciones se puede variar mucho este comportamiento. Si no se le pasa ningún fichero como argumento hace la búsqueda en su entrada estándar.

 * `grep [opciones] <patrón> [ficheros]`

Algunas opciones:

 *  -c devuelve sólo la cantidad de líneas que contienen al patrón.
 *  -i ignora las diferencias entre mayúsculas y minúsculas.
 *  -H imprime además de las líneas, el nombre del fichero donde se encontró el patrón. Es así por defecto cuando se hace la búsqueda en más de un fichero.
 *  -l cuando son múltiples ficheros sólo muestra los nombres de aquellos donde se encontró al patrón y no las líneas correspondientes.
 *  -v devuelve las líneas que no contienen el patrón.
 *  -r busca en un directorio de forma recursiva.
 *  -n imprime el número de cada línea que contiene al patrón.

### Ejemplos

 * `$ grep linux /usr/share/doc`
 * `$ grep root /etc/passwd`
 * `# grep -n error /var/log/messages`
 * `$ grep -i pepe /etc/passwd`
 * `$ grep -c root /etc/group`
 * `$ grep -l -r -i img /var/www/html/`
 * `$ ls –lia | grep “carta roja”`

## Comando find

El comando find es uno de los más poderosos en un sistema Linux. Permite buscar de forma recursiva en un directorio a todos los ficheros que cumplan ciertas condiciones. Las condiciones pueden estar relacionadas con el nombre de los ficheros, el tamaño, los permisos, el tipo, las fechas de acceso y modificación, etc.

### Sintaxis

`find [camino] [opciones]`

Algunas opciones:

 *  -name <expresión> permite especificar patrones para los nombres de los ficheros a buscar.
 *  -iname <expresión> permite especificar patrones para los nombres de los ficheros a buscar sin tener en cuenta mayúsculas y minúsculas.
 *  -type <tipo> permite indicar el tipo de fichero a buscar. Este puede ser d para directorios, f para ficheros regulares, l para enlaces simbólicos, b para dispositivos de bloque, c para dispositivos de carácter, p para tuberías y s para sockets.
 *  -size +/-<n> permite indicar el tamaño máximo y/o mínimo de los ficheros a buscar. Por defecto el tamaño se expresa en bloques de 512 bytes, pero si se precede este por un carácter c se referirá a bytes, k a kilobytes, w a palabras de dos bytes y b a
bloques.
 *  -perm [+|-]<modo> permite referirse a aquellos ficheros cuyos permisos sean exactamente modo, incluya todos los de modo (signo -) o incluya alguno de los de <modo> (signo +). El valor de <modo> se expresa en forma numérica.
 *  -exec <comando> ; permite definir un comando a ejecutarse para cada resultado de la búsqueda. La cadena {} se sustituye por el nombre de los ficheros encontrados. El caracter ; permite indicar la finalización del comando. (Tanto {} como ; tienen que ir entre comillas o entre contrabarras para evitar que sea sustituido por el shell).

### Ejemplos

 * `$ find /etc -name '*.conf' `
 * busca en /etc todos los ficheros con extensión conf`

 * `$ find / -size +10240k -size -20480k`
 * busca los ficheros cuyo tamaño esté entre 10M y 20M

 * `$ find -perm +1000 -type d`
 * busca los directorios que posean el permiso t

 * `# find / -name core -exec rm -i “{}” “;”`
 * busca todos los ficheros que se nombren core y los borra interactivamente. Los signos  “” se utilizan para proteger de la interpretación del shell

## Comando locate
El comando locate busca en una base de datos, actualizada periódicamente, todos los paths en la jerarquía de ficheros que contengan una cadena determinada. Para crear esta base de datos o actualizarla se debe invocar por root el comando updatedb (o locate -u).

En las distribuciones actuales esta tarea se hace de forma automática, aunque el usuario **root** normalmente tiene que ejecutarlo al menos una vez para crear la base de datos).

### Ejemplo:

* `$ locate passwd`
