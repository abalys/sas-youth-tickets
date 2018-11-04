#!/bin/bash
jq '.outboundLowestFares | del(.[].associatedLowestFares, .[].basePrice, .[].totalTax, .[].points, .[].formattedBasePrice, .[].formattedTotalTax, .[].formattedTotalPrice, .[].currency, .[].productName) '
