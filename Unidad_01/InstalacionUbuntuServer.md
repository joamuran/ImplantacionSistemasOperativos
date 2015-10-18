# Instalación de Ubuntu Server #

## Creación de la máquina virtual ##

### Nombre y tipo ###

![UbuntuServer_1](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_1.PNG)

Establecemos el nombre y la *arquitectura* de la máquina virtual

* ubuntuServer
* LinuX
* Ubuntu (64-bits)

----

### Memória RAM para la MV ###

![UbuntuServer_2](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_2.PNG)

Establecemos 768 : debido a que los ordenadores no nos permite mucho más

----

### Disco duro para la MV ###


![UbuntuServer_3](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_3.PNG)

Creamos un nuevo disco duro para la máquina virtual.

![UbuntuServer_4](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_4.PNG)

El tipo de disco duro será : VDI *VirtualBox Disk Image*

![UbuntuServer_5](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_5.PNG)

El espacio será reservado de manera dinámica.

![UbuntuServer_6](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_6.PNG)

Lo *dejaremos crecer* hasta **20GB**


----

### Red de la MV ###

Esta máquina virtual va a tener algo diferente a la anterior, a la *ubuntuDesktop*, la idea es que esta máquina esté conectada a dos redes, una la red que tiene *internet* y la otra la red *controlada* por nuestro servidor, de esta manera los ordenadores que conectemos a la red interna estarán bajo nuestro servidor, y se le irán ofreciendo servicios como:

* DHCP
* DNS
* LDAP (Servicio de usuarios en red)
* SAMBA (Carpetas compartidas)
* NFS (Carpetas compartidas)
* NTP (Servicio de hora en internet)
* CUPS (Servicio de impresión)

Esto lo iremos viendo a lo largo del curso, por ahora tan solo nos preocuparemos de configurar de manera **fisica** la red de nuestro entorno. La llamaremos **isolan**

![UbuntuServer_7](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_7.PNG)

----

### Disco de arranque de la MV ###

Seleccionamos la imágen *ISO* de Ubuntu Server que tenemos.

![UbuntuServer_8](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_8.PNG)

----

## Instalación de Ubuntu Server ##

Ahora lo que haremos será instalar Ubuntu Server en la MV que hemos preparado.

### Iniciando la MV ###

Aparecen algunas opciones adicionales que no habiamos visto cuando arrancamos la *desktop*.

![UbuntuServer_9](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_9.PNG)

### Proceso de instalación ###

Si seleccionamos un idioma que no está *totalmente* soportado durante la instalación, el proceso de instalación nos avisa de que es posible que hayan cosas que no salgan en la lengua elegida. En este caso lo que haremos será:

* Elegir *Español*

![UbuntuServer_10](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_10.PNG)

![UbuntuServer_11](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_11.PNG)

### Configuración de la Ubicación ###

En este punto elegimos el lugar donde está situado el ordenador, esto es muy interesante, no solo para el idioma determinado, si no también por que  el cambio de hora se hará automáticamente dependiendo del horario.

Recordar que el horario de España en la Península es:
* GMT+1

![UbuntuServer_12](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_12.PNG)
----

### Configuración del teclado ###

Se nos ofrece la opción de *autodescubrir el teclado*, que consiste en ir pulsando las teclas que nos dice el programa de instalación y él, mediante logica va descartando hasta dar con la configuración adecuada.

![UbuntuServer_13](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_13.PNG)

En nuestro caso lo que seleccionaremos es que le especificaremos nosotros el modelo: Español.
![UbuntuServer_14](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_14.PNG)

![UbuntuServer_15](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_15.PNG)

----

### Configuración de la red ###

El instalador si detecta tarjetas de red disponibles para ser usadas por el equipo cargará los drivers en el núcleo *kernel* y nos mostrará un mensaje donde nos pide que le indiquemos a través de que interfaz de red podrá **salir a internet** para descargarse componentes adicionales si lo necesita y configurar las actualizaciones más adelante en el proceso de instalación.

![UbuntuServer_16](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_16.PNG)
![UbuntuServer_17](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_17.PNG)

En nuestro caso es la tarjeta *eth0* la que dispone de **internet**, ya que la otra estará conectada a la red interna, tal y como hemos especificado en la configuración de la MV.
![UbuntuServer_18](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_18.PNG)
![UbuntuServer_19](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_19.PNG)

----

### Configuración del Hostname ###

El nombre de la máquina es muy importante en el caso de los servidores, ya que como veremos más adelante en la asignatura, se utilizará para resolver en primera instancia muchos de los servicios que configuraremos en el servidor.

![UbuntuServer_20](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_20.PNG)

----

### Configuración de los usuarios ###
![UbuntuServer_21](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_21.PNG)
![UbuntuServer_22](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_22.PNG)
![UbuntuServer_23](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_23.PNG)
![UbuntuServer_24](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_24.PNG)
![UbuntuServer_25](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_25.PNG)

----

### Configuración del NTP ###

![UbuntuServer_26](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_26.PNG)
![UbuntuServer_27](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_27.PNG)

----

### Configuracion de los discos - Particionado ###


![UbuntuServer_28](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_28.PNG)
![UbuntuServer_29](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_29.PNG)
![UbuntuServer_30](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_30.PNG)
![UbuntuServer_31](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_31.PNG)
![UbuntuServer_32](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_32.PNG)
![UbuntuServer_33](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_33.PNG)

----

### Copia del sistema a la raiz ###

![UbuntuServer_34](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_34.PNG)

----

### Configuración del proxy en apt ###

![UbuntuServer_35](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_35.PNG)

----

### Configuración de tasksel y las actualizaciones automáticas ###

![UbuntuServer_36](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_36.PNG)
![UbuntuServer_37](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_37.PNG)
![UbuntuServer_38](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_38.PNG)
![UbuntuServer_39](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_39.PNG)

----

### Instalación del GRUB ###

![UbuntuServer_40](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_40.PNG)
![UbuntuServer_41](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_41.PNG)

----

### Terminando la instalación ###


![UbuntuServer_42](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_42.PNG)
![UbuntuServer_43](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_43.PNG)

----

### Iniciando el nuevo sistema ###


![UbuntuServer_44](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_44.PNG)
![UbuntuServer_45](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/InstalacionUbuntuServer/UbuntuServer_45.PNG)
