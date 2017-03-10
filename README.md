# Arp_Poison_Defender

Lola-Utils - Mini MITM DEFENDER v1.0!

Mini Script que verifica integridad de la tabla arp creando un documento de texto donde 
se encuentra previamente configurado la direccion IP y la direccion MAC de nuestro 
GATEWAY que se podra ingresar de manera manual o automatica.

Consta de tres verificaciones.

1- Verifica que la direccion IP de nuestro GATEWAY sea la que se encuentra en el archivo
   de configuracion.

2- Verifica que la direccion MAC de nuestro GATEWAY no sea suplantada mediante arp 
   poison.

3- Verifica que no se encuentren direcciones MAC duplicadas en la tabla arp para evitar
   que algun otro host en nuestra red se encuentre bajo un ataque de arp poison.

Archivos:

Crea la carpeta /logs/ en la ruta donde se encuentre el archivo lolaarp.sh.
Esta contienen los siguientes archivos:

/logs/.reg.txt <- Archivo Oculto donde se guarda la config ( IP/MAC del GATEWAY ).

/logs/Dlog.txt <- Log Detallado. Este es el que veremos nosotros. 

/logs/log.txt <- Log Resumido. Solo para mostrarlo en el status del script. 

/logs/temp.txt <- Archivo de intercambio. uso del programa. 

Modo de uso: 

bash lolaarp.bash

Nota: Se requiere usuario con privilegios de administrador.

NOTA IMPORTANTE: 

1) 
DEJAR SIEMPRE EN SEGUNDO PLANO Y VERLO DE VEZ EN CUANDO.  
DEJAR SIEMPRE EN SEGUNDO PLANO Y VERLO DE VEZ EN CUANDO. 
DEJAR SIEMPRE EN SEGUNDO PLANO Y VERLO DE VEZ EN CUANDO. 

2) 
UNA VEZ QUE OCURRA UNA ENTRADA EN EL LOG GUARDAR UN RESPALDO PARA TOMAR ACCIONES.   
UNA VEZ QUE OCURRA UNA ENTRADA EN EL LOG GUARDAR UN RESPALDO PARA TOMAR ACCIONES.   
UNA VEZ QUE OCURRA UNA ENTRADA EN EL LOG GUARDAR UN RESPALDO PARA TOMAR ACCIONES.   

3) 
POSTERIOR AL RESPLADO HACERLE UN WIPE A LOS LOGS CON LA OPCION 99 EN EL MENU.  
POSTERIOR AL RESPLADO HACERLE UN WIPE A LOS LOGS CON LA OPCION 99 EN EL MENU.  
POSTERIOR AL RESPLADO HACERLE UN WIPE A LOS LOGS CON LA OPCION 99 EN EL MENU.  

Gracias por tomarte tu tiempo de leer esto.  :)
