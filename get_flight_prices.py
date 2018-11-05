#!/usr/bin/python3
import json
import urllib.parse
from prettytable import PrettyTable
import requests


def parse_config():
    date='20181201'
    origin='CPH'
    destination='BER'
    return {
        "displayType": "CALENDAR",
        "channel": "web",
        "bookingFlow": "REVENUE",
        "yth": "1",
        "outDate": date,
        "inDate": date,
        "from": origin,
        "to": destination,
        "pos": "dk"
        }

def get_flight_dates_union(raw_json):
    i=raw_json['inboundLowestFares']
    o=raw_json['outboundLowestFares']
    dates=set(i.keys()).union(set(o.keys()))
    return sorted(list(dates))

def fetch_json(conf):
    url="https://api.flysas.com/offers/flights?{}".format(urllib.parse.urlencode(conf))
    return requests.get(url).json()

def get_flight_price(json, date):
    date_object=json.get(date, {'n':'null'})
    return(str(date_object.get('totalPrice', 'Null')) + " " + str(date_object.get('currency', '')))

def get_lowest_fares(json, sorted_dates):
    return [[k, get_flight_price(json['outboundLowestFares'], k), get_flight_price(json['inboundLowestFares'], k)] for k in sorted_dates]

def print_pretty_table(headers, data):
    t = PrettyTable(headers)
    for l in data:
        t.add_row(l)
    print(t)


def main():
    conf=parse_config()
    raw_json=fetch_json(conf)
    dates=get_flight_dates_union(raw_json)
    headers=['Date', 'outbound', 'inbound']
    data=get_lowest_fares(raw_json, dates)
    print_pretty_table(headers, data)

main()
