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

## Ejercicio

Vamos a crear un usuario de prueba para que veais cuales son los datos que se piden en la creación.

 `
sudo adduser violin
 `
