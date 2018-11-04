#!/bin/bash

usage() { echo "Usage: $0 -m MONTH [-d DAY] [-y YEAR] -c CITY 

Example: $0 -m 12 -d 01 -c BER

args:
MONTH #month of low fares [01 - 12]
YEAR  #year of departure [2018, 2019]. If not given defaults to 2019
CITY  #Three upper case letters representing the airport. Ex: PLQ, MXP, LON, BER
DAY   #Day of the month of departure [01-31]. This is a required parameter by SAS api. 
      #As the aim is to get the results of the whole month this defaults to 01 if not given.
"; exit 1; }


#Setting the default arguments of DAY and YEAR
d=01
y=2018
#Parsing arguments
while getopts ":m:d:y:c:" o; do
    case "${o}" in
        m)
            m=${OPTARG}
            ;;
        d)
            d=${OPTARG}
            ;;
	y)
	    y=${OPTARG}
	    ;;
	c)
	    c=${OPTARG}
	    ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

#Checking that the mandatory arguments for MONTH and CITY ar given
if [ -z "${m}" ] || [ -z "${c}" ]; then
    usage
fi

#Due to limitation of getops, only single letter variable can be used in the function above. 
#To make it more clear throught these scripts we change the variable names to the more obvious ones.
MONTH=${m}
DAY=${d}
YEAR=${y}
CITY=${c}
file=raw_flights_data_${CITY}_${YEAR}_${MONTH}.json

echo "
Running with the following parameters:
YEAR=$YEAR
MONTH=$MONTH
DAY=$DAY
DESTINATION=$CITY
"

curl "https://api.flysas.com/offers/flights?displayType=CALENDAR&channel=web&bookingFlow=REVENUE&yth=1&outDate=${YEAR}${MONTH}${DAY}&inDate=${YEAR}${MONTH}${DAY}&from=CPH&to=${CITY}&pos=dk" > $file

python parser.py $file
