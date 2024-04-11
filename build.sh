if [ -d './PowerBI-Icons' ]; then
    echo 'PowerBI-Icons already present'
else
    git clone https://github.com/microsoft/PowerBI-Icons
fi
rm -rf ./PowerBI-Icons/.git

git clone https://github.com/hakimel/reveal.js.git
cd reveal.js && npm install
