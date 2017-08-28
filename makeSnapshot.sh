#/bin/bash

RELEASEFOLDER=${1:-snapshot}
dbpedia_links=${2:-.} #</path/to/dbpedia-links>
www=${3:-../www} #</path/to/www>
#REVISIONFOLDER=${4:-$RELEASEFOLDER}


git pull 
mvn clean install exec:java -Dexec.mainClass="org.dbpedia.links.CLI" -Dexec.args="--generate"
./makeRelease.sh $RELEASEFOLDER $dbpedia_links $www
cp snapshot/data.json tools/linkviz/data/
git add tools/linkviz/data/
git commit -m "daily  json"
git push 