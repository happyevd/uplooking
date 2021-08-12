#!/bin/bash

IFS=:
for i in `echo $PATH`
do
   echo $i
done
