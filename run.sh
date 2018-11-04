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


d=01
y=2018
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

if [ -z "${m}" ] || [ -z "${c}" ]; then
    usage
fi

MONTH=${m}
DAY=${d}
YEAR=${y}
CITY=${c}


echo "
Running with the following parameters:
YEAR=$YEAR
MONTH=$MONTH
DAY=$DAY
DESTINATION=$CITY
"
