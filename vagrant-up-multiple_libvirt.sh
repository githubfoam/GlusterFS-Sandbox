#!/bin/bash

for i in {1..3}
do
    vagrant up --provider=libvirt gluster$i &
    sleep 2
done

vagrant up --provider=libvirt client &

wait
