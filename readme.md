# Generic Address Parser

This program parse addresses in Excel files using the libpostal library to extract their part into street, city, state, postal code, country

From Microsoft Powershell use the following (requires Docker)
> docker run --rm -it -v $&#x7b;pwd&#x7d;:/home/script/data $(docker build -t addp -q https://github.com/iguzu/addressParser.git) <address file.xlsx> <Result.csv>

Please note that building the image the first time can take a long time, don't worry!

To see the command line tool help use the following:

> docker run --rm -it -v $&#x7b;pwd&#x7d;:/home/script/data $(docker build -t addp -q https://github.com/iguzu/addressParser.git) -h
