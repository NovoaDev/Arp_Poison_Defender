#!/bin/bash

#=========================================================================
#                  Author: lola-rica                                     =
#                  lolatmp@gmail.com                                     =
#                   github/Saycoron                                      =
#=========================================================================

inicio(){

	currentTask="inicio"

	opcionesTerminal	
	bannerInit
	checkRoot
	checkTodo
	inicioProg

}

###################################################
#  INICIO Opciones de terminal
###################################################

opcionesTerminal(){

	currentTask="opcionesTerminal"

	maxVentana
	tituloVentana
	colorLetra
	varBasicas

}

maxVentana(){

	currentTask="maxVentana"

	printf '\033[8;32;115t'

}

tituloVentana(){

	currentTask="tituloVentana"

	title='echo -ne "\033]0; Lola-Utils - MINI MITM DEFENDER v1.0!\007"'
	$title

}

colorLetra(){

	currentTask="colorLetra"

	blue=$(echo '' '\033[34m')
	cyan=$(echo '' '\033[36m')
	green=$(echo '' '\033[32m')
	red=$(echo '' '\033[31m')
	white=$(echo '' '\033[0m')
	yellow=$(echo '' '\033[33m')
	
}

varBasicas(){

	currentTask="varBasicas"

	terminal="gnome-terminal -x"

}

###################################################
#  FIN Opciones de terminal
###################################################

###################################################
#  INICIO Check Root
###################################################

checkRoot(){
	
	currentTask="checkRoot"
	
	if [ "$(id -u)" != "0" ];
     	 then
  	    	sleep 1
  		  	echo "                          [$yellow ! $white] [Check Privilegios Root]";
  		 	sleep 1
  	      	echo "                          [$yellow ! $white] [Usuario]: $USER";
  		  	sleep 1
  		  	echo "                          [$red x $white] [$red ERROR $white]: Tienes que ejecutar como$red ROOT $white";
  		  	echo "                          [$red x $white] Usa el comando sudo :$red sudo bash lolamac.bash $white";
  		  	echo ""
  		  	sleep 1
  		  	exit
      	else
  		  	sleep 1
  		  	echo "                          [$yellow ! $white] [Check Privilegios Root]";
  		  	sleep 1
  	  	  	echo "                          [$yellow ! $white] [Usuario]: $USER ";
  		  	sleep 1   
  		  	echo "                          [$green ✔ $white] [Privilegios de Root]";
  		  	echo ""
  		  	sleep 1  
   	fi

}

###################################################
#  FIN Check Root
###################################################

###################################################
#  INICIO Check Carpetas
###################################################


checkTodo(){ 

	currentTask="checkTodo"

	rutasDelFoc
	checkExistenciaRutas

}

rutasDelFoc(){ 

	currentTask="rutasDelFoc"

	rutaPwd="$(pwd)"
	rutaCarpeta=$(echo "$rutaPwd/logs")	
	rutaFileReg=$(echo "$rutaCarpeta/.reg.txt")
	rutaFileLog=$(echo "$rutaCarpeta/log.txt")
	rutaFileDetaillLog=$(echo "$rutaCarpeta/Dlog.txt")
	rutaFileTemp=$(echo "$rutaCarpeta/temp.txt")
}

checkExistenciaRutas(){

	currentTask="checkExistenciaRutas"
	
	if [ -d $rutaCarpeta ];
		then
			echo "             Verificado Carpetas:$yellow $rutaCarpeta $white -  Status:$green OK $white"
		else
			echo "             Verificado Carpetas:$yellow $rutaCarpeta $white -  Status:$yellow CREADO.. $white"
			mkdir $rutaCarpeta
	fi

	if [ -f $rutaFileReg ];
	    then
			echo "             Verificado Archivos:$yellow $rutaFileReg $white -  Status:$green OK $white"
		else
			echo "             Verificado Archivos:$yellow $rutaFileReg $white -  Status:$yellow CREADO.. $white"
			touch $rutaFileReg
	fi

	if [ -f $rutaFileLog ];
	    then
			echo "             Verificado Archivos:$yellow $rutaFileLog $white -  Status:$green OK $white"
		else
			echo "             Verificado Archivos:$yellow $rutaFileLog $white -  Status:$yellow CREADO.. $white"
			touch $rutaFileLog
	fi

	if [ -f $rutaFileDetaillLog ];
	    then
			echo "             Verificado Archivos:$yellow $rutaFileDetaillLog $white -  Status:$green OK $white"
		else
			echo "             Verificado Archivos:$yellow $rutaFileDetaillLog $white -  Status:$yellow CREADO.. $white"
			touch $rutaFileDetaillLog
	fi

	if [ -f $rutaFileTemp ];
	    then
			echo "             Verificado Archivos:$yellow $rutaFileTemp $white -  Status:$green OK $white"
		else
			echo "             Verificado Archivos:$yellow $rutaFileTemp $white -  Status:$yellow CREADO.. $white"
			touch $rutaFileTemp
	fi

}

###################################################
#  FIN check carpetas
###################################################

###################################################
#  INICIO PROG
###################################################

inicioProg(){

	currentTask="inicioProg"

	checkContenidoFileReg
	agregarSelect
	llamarVarFileReg
	programLoop
}

checkContenidoFileReg(){

	currentTask="checkContenidoFileReg"

	ContenidoFileReg=$(cat $rutaFileReg)
	blank=""

	if [ "$ContenidoFileReg" != "$blank" ];
		then
			echo ""
			echo "        ----=[           [$green ✔ $white] [ Archivo Reg Existente ]             ]=---- " 
			echo ""
			sleep 1
			echo "              $white              1 )$blue -$white Agregar Manual" 
			echo "              $white              2 )$blue -$white Agregar Automatico" 
			echo "              $white              3 )$blue -$white Usar Existente" 
			echo "              $white             99 )$blue -$white EliminarLogs" 
			
		else
			echo ""
			echo ""
			echo "        ----=[           [$red X $white] [ Archivo Reg Vacio ]             ]=---- " 
			sleep 1
			echo ""
			echo "              $white              1 )$blue -$white Agregar Manual" 
			echo "              $white              2 )$blue -$white Agregar Automatico"
	fi

	read numArchivo

}

agregarSelect(){

	currentTask="agregarSelect"


	case "$numArchivo" in
		"1")
			agregarManu
		;;
		"2")
			agregarAuto	
		;;
		"3")
			usarExist	
		;;
		"99")
			eliminarLogs
			clear
			inicio	
		;;
		"*")
			checkContenidoFileReg
		;;	
	esac

}

agregarManu(){

	currentTask="agregarManu"

	sleep 1
	echo "              $white          - Indique Direccion$yellow IP$white Del GATEWAY $white " 
	read ipTemp
	sleep 1
	echo "              $white          - Indique Direccion$yellow MAC$white Del GATEWAY $white " 
	read macTemp

	echo "$ipTemp            DIP " > $rutaFileReg 		
	echo "$macTemp           DMA " >> $rutaFileReg
	echo "              $white          -$green ✔ $white Usando Archivo Creado$white" 
	
}

agregarAuto(){

	currentTask="agregarAuto"

	sleep 1
	echo "              $white          - Agregando Direccion$yellow IP$white Automaticamente $white " 
	ipTemp=$(route -n | grep UG | awk '{print $2}')
	sleep 1
	echo "              $white          - Agregando Direccion$yellow MAC$white Automaticamente $white " 
	macTemp=$(arp -na | egrep -w $ipTemp | awk '{print $4}')
	sleep 1
	echo "$ipTemp            DIP " > $rutaFileReg 		
	echo "$macTemp           DMA " >> $rutaFileReg
	echo "              $white          -$green ✔ $white Usando Archivo Creado$white" 

}

usarExist(){

	currentTask="usarExist"
	echo "              $white          -$green ✔ $white Usando Archivo Existente$white" 
	
}

eliminarLogs(){

	currentTask="eliminarLogs"

	rm -r $rutaCarpeta
}

llamarVarFileReg(){

	currentTask="llamarVarFileReg"

	ipCompTemp=$(cat $rutaFileReg | grep DIP)
	macCompTemp=$(cat $rutaFileReg | grep DMA)
	ipComp=$(echo "$ipCompTemp" | cut -c 1-15)
	macComp=$(echo "$macCompTemp" | cut -c 1-17)

}

verMacDupeados(){

	currentTask="verMacDupeados"

	lista=$(arp -an | awk '{print $4}' | sort | uniq -c | grep -v 1) 
	#mete en lista todo las mac que esten repetidas 
	#awk toma el cuarto parametro que es la mac
	#sort ordena menor a mayor
	#unique -c hace que los enumere si encuentra uno repetido los suma
	#grep -v invertido coje todo lo que sea diferente a 1 que es la mac

	if [ "$lista" != "$blank" ]
		then
			escribirLogsMacDup
		else
			contenedor="no hace nada."
	fi

}

verMacAP(){

	currentTask="verMacAP"

	contenedorMacAp=$(arp -an | egrep -w $ipComp | awk '{print $4}')

    if [ "$macComp" != "$contenedorMacAp" ];
    	then
    	escribirLogsMacGate
    	else
    	contenedor="no hace nada."
    fi

}

verIPAP(){

	currentTask="verIPAP"

	ipTemp2=$(route -n | grep UG | awk '{print $2}')

    if [ $ipComp != "$ipTemp2" ];
    	then
    	escribirLogsIPGate
    	else
    	contenedor="no hace nada."
    fi

}

escribirLogsMacDup(){

	currentTask="escribirLogsMacDup"

	tiempo=`date "+%Y-%m-%d %H:%M:%S"`

	echo "ARP Poisoning : " $tiempo >> $rutaFileDetaillLog
	echo "MAC DUPEADAAA : " $lista >> $rutaFileDetaillLog
	arp -an >> $rutaFileDetaillLog
	echo "________________________________________________" >> $rutaFileDetaillLog
	
	echo "ARP Poisoning : "$tiempo >> $rutaFileLog

} 

escribirLogsMacGate(){

	currentTask="escribirLogsMacGate"

	tiempo=`date "+%Y-%m-%d %H:%M:%S"`

	echo "No Coincide la Direccion MAC del GW : " $tiempo >> $rutaFileDetaillLog
	echo "La mac De la Discordia es : " $contenedorMacAp >> $rutaFileDetaillLog
	echo "________________________________________________" >> $rutaFileDetaillLog
	
	echo "No Coincide la Direccion MAC del GW : "$tiempo >> $rutaFileLog

} 

escribirLogsIPGate(){

	currentTask="escribirLogsIPGate"

	tiempo=`date "+%Y-%m-%d %H:%M:%S"`

	echo "No Coincide la Direccion IP del GW : " $tiempo >> $rutaFileDetaillLog
	echo "La IP De la Discordia es : " $ipTemp2 >> $rutaFileDetaillLog
	echo "________________________________________________" >> $rutaFileDetaillLog
	
	echo "No Coincide la Direccion IP del GW :  "$tiempo >> $rutaFileLog

} 

programLoop(){

	currentTask="programLoop"

	sleep 2
	clear
	while [ 1 != 0 ]
		do
			llamarVarFileReg
			verIPAP
			verMacAP
			verMacDupeados

			ContenidoFileLog=$(cat $rutaFileLog)
			
			if [ "$ContenidoFileLog" != "$blank" ];
				then
					clear
					bannerBad
				else
					clear
					bannerOK
			fi

			sleep 10
		done
}
###################################################
#  FIN PROG
###################################################

###################################################
#  INICIO BANNERS
###################################################

bannerInit(){

	currentTask="bannerInit"
	
	clear
	echo "$blue"             
	echo " __         ______     __         ______       __  __     ______   __     __        "
	echo "/\ \       /\  __ \   /\ \       /\  __ \     /\ \/\ \   /\__  _\ /\ \   /\ \       "
	echo "\ \ \____  \ \ \/\ \  \ \ \____  \ \  __ \    \ \ \_\ \  \/_/\ \/ \ \ \  \ \ \____  "
	echo " \ \_____\  \ \_____\  \ \_____\  \ \_\ \_\    \ \_____\    \ \_\  \ \_\  \ \_____\ "
	echo "  \/_____/   \/_____/   \/_____/   \/_/\/_/     \/_____/     \/_/   \/_/   \/_____/ "                                                                               
	echo "$white"
	echo "=================================================================================="

}

bannerOK(){ 

	currentTask="bannerOK"
	clear	
	echo "================================================================================================================"
	echo "            .--.                                                                                 "
	echo "       _____ )  >--._,-.                                                                         " 
	echo "    ./      \---^---<. \                                                                         "
	echo "  ,/                    .          $blue  Lola-Utils -$white                                     "
	echo " /                       \               MINI MITM DEFENDER v1.0!                                "
	echo "|            _,--^---..   | _                                                                    " 
	echo "|           /         ,;._|( \,-.                                                                " 
	echo " .          |    ;  ; )//  _>   /   $blue STATUS$white :                                         "
	echo " |          |     :';,((  (__,*/-.       IP GATEWAY :$green OK$white                             " 
	echo " \           \  .      \    .|, \_)      MAC GATEWAY :$green OK$white                            " 
	echo "  \           |   ----  )    / -/        MAC DUPLICADAS EN TABLA ARP :$green NINGUNA  $white     "
	echo "   ._        /         /    /--.                                                                 "
	echo "     _:-  .- --.___,,,/,,.-/                                                             _ _     "
	echo "   ,       \    ,-. \ ._--/._                                                           (_\_)    "
	echo " <          .__, o\ -   / _)_)                                                         (__<_{}   "
	echo " ,| .     /     \ o\   |_||,-.                                                          (_/_)    "
	echo "  . ( --./        --    | ,|_)                                                         |\ |      "
	echo "    ._(_/              - \                                                              \ | /|   "
	echo "       -.._______,,..,-- /                                                               \|//    "
	echo "       |        |   |                                                                     |/     "
	echo " -hrr- (--....___/)-P,.                                                              ,.,.,|.,.,. " 
	echo "      do----,oooood8P\.                                                              ^ ^ ^ ^ ^ ^ "
	echo "================================================================================================================"

}

bannerBad(){

	currentTask="bannerBad"
	
	tail -9 $rutaFileLog > $rutaFileTemp

	linea1=$(sed -n 1p $rutaFileTemp)
	linea2=$(sed -n 2p $rutaFileTemp)
	linea3=$(sed -n 3p $rutaFileTemp)
	linea4=$(sed -n 4p $rutaFileTemp)
	linea5=$(sed -n 5p $rutaFileTemp)
	linea6=$(sed -n 6p $rutaFileTemp)
	linea7=$(sed -n 7p $rutaFileTemp)
	linea8=$(sed -n 8p $rutaFileTemp)
	linea9=$(sed -n 9p $rutaFileTemp)

	clear
	echo "================================================================================================================"
	echo "               ,-.     , (   
               |  \,-./   \ 
           _,- \ ._\_.-...--.  $blue  Lola-Utils -$white 
         ,      ) ,          \       MINI MITM DEFENDER v1.0!
       ,       (,             | 
      /             _,.---.  , 	$blue STATUS$white : 
     |            , ,-- -./ |    $red   ULTIMOS REGISTROS.. $white
     |           |   ,  ,/  | 	     $linea1
     |           |    ,.  . \        $linea2
     \           \         | \       $linea3
      \           \  _,^^-.|  |      $linea4
       \          /,^     ,   |      $linea5
        ._      ,--.,--;; _,;        $linea6
           +-.-    ,o.__;            $linea7
  _,,....._/,   .\_/|o|  / .         $linea8
 /  ___   / |    \   -   \,-\        $linea9
| .  _.:./  |_....>       \,| 
    ._    .  /    |    ___,| _._ 
 \     --..i._/ / --;\---- , ,  |   $red REVISAR EL LOG PARA MAS DETALLES !!!$white
 /     ......_     ,-;-\--: /   /   $red REVISAR EL LOG PARA MAS DETALLES !!!$white
 |   ________,,.\,  /,    // _,     $red REVISAR EL LOG PARA MAS DETALLES !!!$white
 |              _\ //   _.;,, ,     $red REVISAR EL LOG PARA MAS DETALLES !!!$white
 |  -hrr-.,---- _,\.:-- /|  ,  
   -......,---    \__, ,___, "
    echo "================================================================================================================"

}

###################################################
#  FIN BANNERS
###################################################

inicio
