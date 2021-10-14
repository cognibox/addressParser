# Generic Address Parser

This program parse addresses in Excel files using the libpostal library to extract their part into street, city, state, postal code, country

From Microsoft Powershell use the following (requires Docker)
> docker run --rm -it -v ${pwd}:/home/script/data $(docker build -t addp -q https://github.com/iguzu/addressParser.git) <address file.xlsx> <Result.csv>

To see the command line tool help use the following:

> docker run --rm -it -v ${pwd}:/home/script/data $(docker build -t addp -q https://github.com/iguzu/addressParser.git) -h
