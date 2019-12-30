#!/bin/bash

set -e

cd $(dirname $0)

server_dir="../servers/groovy-language-server"
[ -d $server_dir ] && rm -rf $server_dir
mkdir $server_dir && cd $server_dir

git clone --depth=1 https://github.com/prominic/groovy-language-server .
./gradlew build

cat <<EOF >groovy-language-server
#!/bin/sh

DIR=\$(cd \$(dirname \$0); pwd)
java -jar \$DIR/build/libs/groovy-language-server-all.jar
EOF

chmod +x groovy-language-server
