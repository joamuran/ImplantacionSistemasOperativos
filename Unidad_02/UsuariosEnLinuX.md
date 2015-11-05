\newpage
# Usuarios en GNU/LinuX

## Importante

 * Diferenciar entre usuarios y grupos
 * Concepto de permisos

## Usuarios

LinuX es un sistema multiusuario, y se utilizan diferentes usuarios para gestionar de manera segura las capacides y los permisos de las aplicaciones y servicios que ejecuta el SO.

Ya hemos visto que podemos tener varios usuarios logados a la vez en el sistema (*multiusuario*), estos logins pueden ser a través de las consolas normales (*tty[1-6]*), la gráfica (*tty7*) o via logins remotos (*ssh*).

Para iniciar sesión cada usuario tiene dos elementos indispensables:

 * login
 * password

No hay que confundir el login con el *Nombre Completo*, este puede ser con mayusculas, minúsculas, espacios...
Además hay una serie de carpetas y datos que tienen que ver con la creación de un usuario. Esto lo vamos a ver más adelante.

El usuario con más privilegios en LinuX es aquel cuyo login es **root** (Raiz). Este es el único con derechos suficientes para crear o eliminar a otros usuarios, además de acceder a todo el sistema de ficheros sin ninguna restricción. Es el **superusuario** en Debian.

En Ubuntu la cuenta de **root** está deshabilitada, por motivos de seguridad. La idea principal es que si intentamos un ataque por fuerza bruta, si sabemos al menos una de las dos partes de la clave necesaria, es más sencillo conseguir entrar que si tenemos que probar. Sin embargo en Debian lo que se hace es que se deshabilita el login de root via remota (**ssh**), de esta manera podemos logarnos en el equipo con **root** en un equipo, pero si nos estamos conectando via *ssh*, primero tendremos que pasar por un *usuario desconocido*. Como veis son soluciones muy similares en su conclusión final.

Para crear un usuario desde la terminal se puede usar el comando **adduser**.

\newpage
## Ejercicio

Vamos a crear un usuario de prueba para que veais cuales son los datos que se piden en la creación.

 `
sudo adduser violin
 `

Ahora cuando nos pide el password de *sudo* el que nos está pidiendo es el password de nuestro propio usuario, (si este se encuentra en el grupo de *sudo*, esto lo veremos un poco más adelante). En caso de que fueramos el usuario *root* esta operación se puede hacer sin necesidad de usar *sudo* (**su**peruser **do**).

Cuando generamos un usuario en LinuX, por defecto genera un grupo que coincide en nombre con el usuario que generamos (si usamos adduser). Si buscamos en Internet veremos que hay muchas maneras de generar usuarios en LinuX, empezaremos con adduser que es una forma muy cómoda de generalos.

Ahora vamos a generar unos pocos usuarios más:

 * viola
 * violonchelo
 * contrabajo
 * fagot
 * arpa
 * trombon
 * trompa

Si queremos organizarlos para luego más adelante otorgarles privilegios y permisos, permitirles acceder a recursos, etc. Es conveniente que los organizemos en *grupos*.

# Grupos

En Linux además existen grupos de usuarios también administrados por root o por un usuario designado por este. Los grupos permiten otorgar los mismos privilegios a un conjunto de usuarios.

Siempre que se añada un usuario al sistema se creará un grupo con su mismo nombre, llamado grupo primario. Durante la creación o posteriormente, se podrá incorporar el usuario a otros grupos secundarios.

Tanto los usuarios como los grupos se identifican por el sistema a través de un identificador (*ID*) numérico. El usuario root siempre tiene el ID cero. Cada usuario cuando se conecta al sistema posee un identificador de usuario asociado (uid) y un identificador de grupo (gid).

Para comprobar el uid de nuestro usuario, y el gid del grupo principal al que pertenece, podéis ejecutar la orden

 `
 id
 `

 Al añadir un usuario también se creará un directorio base para el mismo con el nombre de su login.  Este directorio se coloca por defecto en el directorio **/home** excepto para root, cuyo directorio  base es **/root**.

La información asociada a los usuarios en un sistema Linux se guarda en el fichero `/etc/passwd`
y las contraseñas y datos afines en  `/etc/shadow`.

Por su parte la información de los grupos y sus miembros están en `/etc/group`.
