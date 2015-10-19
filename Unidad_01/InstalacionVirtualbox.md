# Instalación de VirtualBox

Vamos a describir los métodos de instalación del Sistema de Virtualización VirtualBox.

![VirtualBox Logo](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/SistemasDeVirtualizacion/Captura_1.PNG)

# En Windows
Para la instalación de VirtualBox iremos a la página del proyecto: [Virtualbox](http://virtualbox.org) y seleccionaremos el instalador correcto para nuestro sistema (*x86*/*amd64*).

![Sección de descargas](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/SistemasDeVirtualizacion/Captura_2.PNG)

![Descarga de Virtualbox](https://raw.githubusercontent.com/aberlanas/ImplantacionSistemasOperativos/master/Unidad_01/SistemasDeVirtualizacion/Captura_3.PNG)

Una vez descargado, si lo ejecutamos se nos abrirá un asistente que nos guiará a lo largo del proceso de instalación.

# En GNU/LinuX

## Modo *Windows*
En GNU/LinuX podemos instalar VirtualBox de varias maneras, la primera, tal y como vimos en clase, descargando el fichero de instalación (*.deb*)  y ejecutando la orden:

`dpkg -i ruta_al_fichero.deb`

En el caso de que tengamos paquetes en conflicto, debemos desinstalar los paquetes que den problemas y luego reintentar la instalación.

## Repositorios (*Debian/++*)
En los sistemas que tienen repositorios soportados por VirtualBox, bastaría con añadir al fichero

  /etc/apt/sources.list

La línea de VirtualBox:

  deb http://download.virtualbox.org/virtualbox/debian vivid contrib

Toca sustituir la palabra **vivid** de la linea anterior por la distribución soportada que estemos usando como distro base. Las opciones pueden ser:

Basadas en Ubuntu:
* utopic
* trusty
* raring
* quantal
* precise
* lucid

Basadas en Debian:
* jessie
* wheezy
* squeeze  

A continuación debemos añadir a la lista de repositorios *confiables* el repositorio de **Virtualbox**:

  `wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -`

Una vez realizados estos pasos:

  `sudo apt-get update`
  `sudo apt-get install virtualbox`
