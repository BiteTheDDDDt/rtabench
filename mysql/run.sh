#!/bin/bash

TRIES=3

for file in "$(dirname "$0")/queries"/*.sql; do
    sync

    query="$(cat "$file")"

    # We echo the query without any line breaks
    echo "$(tr '\n' ' ' < "$file" | tr -s " ")"
    for i in $(seq 1 $TRIES); do
        sudo mysql -vvv --database=test -e "$query"
    done;
done;
