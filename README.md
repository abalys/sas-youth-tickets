# SAS Youth tickets price parser

## Motivation
The motivation for writing this lightweight application came from struggling from checking fares with the horrible sas.dk UI.
The reason why I didn't use skyscanner or flights.google.com was because they do not crawl prices for YOUTH tickets
which are significantly cheaper.

## Prerequisites
For getting the raw json data cURL is used. For json parsing I used Python 3.5.2 along with two libraries


json - for loading the actual json file


PrettyTable - for being able to print the results with a nice output

## Usage
To execute application run 
```
./run.sh
```
with the required parameters which are described in run.sh

## Example input output
This represents from London to Hong Kong in December
```
./run.sh -m 12 -c HKG -h LON
```

With the output as below
```
Running with the following parameters:
YEAR=2018
MONTH=12
DAY=01
DESTINATION=HKG
ORIGIN=LON

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 20220    0 20220    0     0   3639      0 --:--:--  0:00:05 --:--:--  4649
+------------+---------------------+--------------------+
|    Date    | outboundLowestFares | inboundLowestFares |
+------------+---------------------+--------------------+
| 2018-12-01 |      2027.0 DKK     |       Null         |
| 2018-12-03 |        Null         |     1479.0 DKK     |
| 2018-12-04 |        Null         |     1479.0 DKK     |
| 2018-12-05 |      2027.0 DKK     |       Null         |
| 2018-12-06 |      2027.0 DKK     |       Null         |
| 2018-12-07 |        Null         |     1479.0 DKK     |
| 2018-12-09 |        Null         |     1479.0 DKK     |
| 2018-12-10 |        Null         |     1479.0 DKK     |
| 2018-12-11 |        Null         |     1479.0 DKK     |
| 2018-12-16 |        Null         |     1479.0 DKK     |
| 2018-12-17 |        Null         |     1479.0 DKK     |
| 2018-12-24 |        Null         |     1479.0 DKK     |
| 2018-12-27 |        Null         |     1479.0 DKK     |
| 2018-12-28 |        Null         |     1479.0 DKK     |
| 2018-12-29 |        Null         |     1479.0 DKK     |
| 2018-12-30 |        Null         |     1479.0 DKK     |
| 2018-12-31 |        Null         |     1479.0 DKK     |
+------------+---------------------+--------------------+
```
