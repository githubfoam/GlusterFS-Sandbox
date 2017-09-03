#!/bin/bash

for i in {1..3}
do
    vagrant up gluster$i &
    sleep 2
done

vagrant up client &

wait
