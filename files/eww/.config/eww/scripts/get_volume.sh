#!/bin/sh

pulsemixer --get-volume | awk '{ print $1 }'
