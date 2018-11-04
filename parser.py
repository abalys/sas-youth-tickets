#!/usr/bin/python3
import json
import sys
from prettytable import PrettyTable


inputfile=sys.argv[1]

with open(inputfile) as f:
    loaded=json.load(f)

i='inboundLowestFares'
o='outboundLowestFares'
inbound=loaded[i]
outbound=loaded[o]
null_dict={'totalPrice': "Null", 'currency': ''}

dates=set(inbound.keys()).union(set(outbound.keys()))
sorted_dates=sorted(list(dates))


def line(json, key, date):
    date_object=json[key].get(date, null_dict)
    return(str(date_object.get('totalPrice')) + " " + str(date_object.get('currency')))

def get_lowest_fares(json):
    return [[k, line(json, o, k), line(json, i, k)] for k in sorted_dates]

def get_pretty_table(headers, data):
    t = PrettyTable(headers)
    for l in data:
        t.add_row(l)
    return t

headers=['Date', o, i]
print(get_pretty_table(headers, get_lowest_fares(loaded)))
