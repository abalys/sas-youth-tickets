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
with the required parameters which are described in ``run.sh```

## Example input output
```
./run.sh -m 12 -c BER
+------------+---------------------+--------------------+
|    Date    | outboundLowestFares | inboundLowestFares |
+------------+---------------------+--------------------+
| 2018-12-01 |         Null        |       551.0        |
| 2018-12-02 |        347.0        |       395.0        |
| 2018-12-03 |        347.0        |       395.0        |
| 2018-12-04 |        503.0        |       551.0        |
| 2018-12-05 |        474.0        |       522.0        |
| 2018-12-06 |        503.0        |       395.0        |
| 2018-12-07 |        488.0        |       395.0        |
| 2018-12-08 |         Null        |       551.0        |
| 2018-12-09 |        347.0        |       395.0        |
| 2018-12-10 |        347.0        |       551.0        |
| 2018-12-11 |        503.0        |       551.0        |
| 2018-12-12 |        474.0        |       522.0        |
| 2018-12-13 |        347.0        |       395.0        |
| 2018-12-14 |        347.0        |       395.0        |
| 2018-12-15 |         Null        |       551.0        |
| 2018-12-16 |        474.0        |        Null        |
| 2018-12-17 |        503.0        |       551.0        |
| 2018-12-18 |         Null        |       551.0        |
| 2018-12-20 |        503.0        |       522.0        |
| 2018-12-22 |         Null        |       395.0        |
| 2018-12-26 |        347.0        |       395.0        |
| 2018-12-27 |        474.0        |       522.0        |
| 2018-12-28 |        347.0        |       395.0        |
| 2018-12-29 |        347.0        |       395.0        |
| 2018-12-30 |         Null        |       522.0        |
+------------+---------------------+--------------------+
```
