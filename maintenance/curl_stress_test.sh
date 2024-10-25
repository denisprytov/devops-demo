#!/bin/bash
while true; do
    clear
    curl -sI --parallel --parallel-immediate --parallel-max 50 --config ./urls.txt ; echo "Press [CTRL+C] to stop..."
    sleep 0.5
done
