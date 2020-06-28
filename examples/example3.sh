#!/bin/bash

echo "Call this script (example3.sh) with parameters --person <some person> --place <some place> --thing <something>"

source /dev/stdin <<<"$(curl https://raw.githubusercontent.com/scottglenblanch/bash-argument-parser/main/src/arg-parser.sh)" $@

echo "--person is ${PERSON}"
echo "--place is ${PLACE}"
echo "--thing is ${THING}"
