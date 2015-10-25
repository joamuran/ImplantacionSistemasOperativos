# Anexo : IRQ

IRQ=Interrupt ReQuest=Pedido de interrución.

Como lo dice la palabra, es una petición de interrupcion de parte de la **BIOS** (Basic Input Output System) hacia la CPU, o sea, que deje de hacer sus tareas (pedido de interrupción) para que pase a procesar lo que necesita un hardware específico.

Siendo esto la definición de IRQ, vamos a adentrarnos un poco más en su funcionamiento.
Cuando un hardware, la impresora por ejemplo, quiere que la CPU procese su trabajo, envía una petición de IRQ al chip que maneja las interrupciones IRQ. Este chip puede ser parte de la CPU o estar alojada aparte en el MOBO y lo que hace basicamente es dar prioridad a los pedidos IRQ y habilitarlos o deshabilitarlos según la prioridad asignada.

El funcionamiento es el siguiente: cuando una petición de interrupción llega a la CPU, este guarda el estado de lo que estaba haciendo, para pasar a responder el pedido de IRQ y realizar la tarea necesaria (imprimir por ejemplo). Una vez terminada la tarea pedida por el IRQ, toma el flag de estado que guardó enteriormente y continúa. Así sucede con cada una de las tareas que va realizando, pudiendo resolver las tareas.

Anteriormente esto sucedía de otra manera, lo que ocurría era que el procesador cada cierto tiempo miraba si había alguna petición hardware. Esto consumía tiempo innecesario al CPU cuando no había tareas que realizar, y también formaba una cola de pedidos de proceso larga, haciendo la tarea lenta.

Hay distintos tipos de IRQ dentro de nuestro PC.

 * Interrupciones de Hardware: Son peticiones que pide un determinado dispositvio hardware, por ejemplo la Impresora.
 * Interrupciones de Software: son las que pide un software, para que se realicen algunas tareas de procesamiento para continuar con su  ejecución.
 * Interrupciones Trampas: estas son producidas por el software y esto se da porque una interrupción de software puede hacer una llamada a  otra tarea. En programación se puede hacer que algo se produzca, de acuerdo a como termina lo anterior.
 * Para la configuración de periféricos, cada uno debe tener un canal IRQ, este pasa a tener una prioridad conocida por la CPU, y así, cuando recibe una petición sabe como responder.

Antes que los dispositivos **PnP** (*Plug and Play* (enchufa y funciona))llegaran, había que configurar todo a mano. Hoy en día algún que otro servidor lo requiere, algunos PCs viejos o algún conflicto que dá este Plug and Play al asignar lineas de IRQ erróneas.

¿Como se asignan? Simplemente se usa esta tabla que sirve como referencia o según las especificaciones de hardware:

| IRQ | Descripción |
| :------|:-------|
|IRQ 0| cronómetro del sistema.|
|IRQ 1| controlador del teclado.|
|IRQ 2| Interrupciones en cascada para las interrupciones IRQ del 8 al 15.|
|IRQ 3| Segundo Puerto Serie (COM2/COM4).|
|IRQ 4| Primer Puerto Serie (COM1/COM3).|
|IRQ 5| Tarjeta de sonido.|
|IRQ 6| Controlador de disquetera.|
|IRQ 7| Puerto Paralelo LPT1 (impresoras).|
|IRQ 8| Reloj del Sistema.|
|IRQ 9 10 11| Interrupción disponible para periféricos extras.|
|IRQ 12| Mouse PS/2 o Placa de Red o similares.|
|IRQ 13| Coprocesador/Unidad de punto flotante|
|IRQ 14| Canal IDE Primario|
|IRQ 15| Canal IDE Secundario|

**No se pueden asignar dos dispositivos al mismo IRQ**
