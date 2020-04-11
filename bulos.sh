#!/bin/bash

#set -x

DIA=`date '+%Y/%m/%d'`

# La URL es del tipo
# https://maldita.es/malditobulo/2020/04/10/coronavirus-bulos-pandemia-prevenir-virus/

if [ -z "$1" ]
then
	URL="https://maldita.es/malditobulo/$DIA/coronavirus-bulos-pandemia-prevenir-virus/"
else
	URL=$1
fi

echo "Se utiliza la URL $URL"

INDEX=$HOME/index.html

# Por si acaso se borra
rm -f ${INDEX}*

wget -q -O $INDEX $URL

if [ $? -ne 0 ]
then
	echo "No se ha podido traer el fichero index.html quizas la URL no sea correcta"
	exit 1
fi

if [ -s "$INDEX" ] # Si existe y no esta vacio
then
	TMP=`mktemp /tmp/bulos_XXXX`

	grep '<h2>' $INDEX > $TMP

	rm $INDEX

	sed -i '/doctora Cristina Mar/d' $TMP
	sed -i '/audio pidiendo que se manden cartas a ingresados/d' $TMP
	
	if [ ! -s "$HOME/bulos" ] # Si no existe el fichero con bulos se crea vacio
	then
		mv $TMP $HOME/bulos
		cat $HOME/bulos
	else
		diff $HOME/bulos $TMP
		if [ $? -eq 0 ]
		then
			echo "No parece que haya ningun bulo nuevo"
		fi
	fi
else
	echo "No se encuentra el fichero $INDEX quizas este mal la URL"
	exit 1

fi
