#! /bin/bash

if pidof pavucontrol
then
   kill -9 $(pidof pavucontrol) &
else
   pavucontrol &
fi
