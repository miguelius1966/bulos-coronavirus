# bulos-coronavirus
Script para obtener nuevos bulos sobre el coronavirus de maldita.es
Se trata de un script en bash, que utilizando la información proporcionada por maldita.es muestra los nuevos bulos que van desmitiendo.
Para instalar el script sólo hay que copiar el fichero bulos.sh en un determinado directorio y ejecutarlo desde ahí
```
./bulos.sh https://maldita.es/malditobulo/2020/04/10/coronavirus-bulos-pandemia-prevenir-virus/
```
O se puede ejecutar sin escribir la URL y el script utiliza el día en el que se ejecuta para crear la URL
```
./bulos.sh
```

En la primera ejecución se obtendrán todos los bulos que muestre la URL y se creará un fichero llamado bulos en el directorio $HOME del usuario que lance el script. Este fichero no se debe borrar porque si se hace en todas las ejecuciones del script saldrían todos los bulos otra vez.

Al ejecutar el comando como se ha comentado anteriormente, se obtendrá algo así como:
```
...
<h2>¿Existen medicamentos específicos para prevenir o tratar el nuevo coronavirus?</h2>
<h2>¿Las vacunas contra la neumonía protegen del nuevo coronavirus?</h2>
<h2>¿Inhalar una solución salina puede ayudar a prevenir la infección? </h2>
<h2>¿El enjuague bucal con gárgaras puede prevenir el contagio?</h2>
<h2>¿Comer ajo ayuda a prevenir la infección?</h2>
<h2>¿Echarse aceite de sésamo en la piel puede impedir que el nuevo coronavirus penetre en el cuerpo?</h2>
<h2>No, la orina infantil no puede proteger frente al nuevo coronavirus</h2>
<h2>No, no y no: la cocaína no puede proteger frente al nuevo coronavirus</h2>
<h2>¿Cuánto tiempo sobrevive el virus en una superficie?</h2>
...
```
Como se puede ver, la salida del comando no puede ser más cutre, pero ayuda a encontrar la información.
