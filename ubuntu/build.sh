#!/bin/bash

docker build --build-arg app='application' --build-arg dir='/usr/' -t gogineni\ubuntu .
