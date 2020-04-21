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

RET=$?
NUM=1

while [ $RET -ne 0 ]
do
        echo "No se ha podido traer el fichero index.html quizas la URL no sea correcta"
        DIA=`date --date="$NUM day ago" "+%Y/%m/%d"`
        URL="https://maldita.es/malditobulo/$DIA/coronavirus-bulos-pandemia-prevenir-virus/"
        echo "Se utiliza la URL $URL"
        wget -q -O $INDEX $URL
        RET=$?
        NUM=`expr $NUM + 1`
        if [ $NUM -eq 20 ]
        then
                echo "Se ha probado 20 veces y no se ha conseguido nada"
                exit 1
        fi
done

if [ -s "$INDEX" ] # Si existe y no esta vacio
then
        TMP=`mktemp /tmp/bulos_XXXX`

        grep '<h2>' $INDEX > $TMP

        rm $INDEX

        sed -i '/doctora Cristina Mar/d' $TMP
        sed -i '/audio pidiendo que se manden cartas a ingresados/d' $TMP
        sed -i 's/<h2>//' $TMP
        sed -i 's/<\/h2>//' $TMP

        if [ -s "$HOME/bulos" ] # Si existe el fichero se ve la diferencia
        then
                diff $HOME/bulos $TMP
                if [ $? -eq 0 ]
                then
                        echo "No parece que haya ningun bulo nuevo"
                fi
        else # Si no existe el fichero se crea con todos los bulos obtenidos
                mv $TMP $HOME/bulos
                cat $HOME/bulos
        fi
else
        echo "No se encuentra el fichero $INDEX quizas este mal la URL"
        exit 1

fi
