if [ -d './PowerBI-Icons' ]; then
    echo 'PowerBI-Icons already present'
else
    git clone https://github.com/microsoft/PowerBI-Icons
fi

rm -rf ./PowerBI-Icons/.git