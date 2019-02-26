#! /bin/bash

if pidof pavucontrol
then pkill pavucontrol &
else pavucontrol &
fi
