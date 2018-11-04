#!/bin/bash
jq '.inboundLowestFares | del(.[].associatedLowestFares, .[].basePrice, .[].totalTax, .[].points, .[].formattedBasePrice, .[].formattedTotalTax, .[].formattedTotalPrice, .[].currency, .[].productName) '
