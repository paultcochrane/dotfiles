#!/bin/bash

wget http://xplanetclouds.com/free/local/clouds_2048.jpg -O ~/.xplanet/cloud_maps/clouds_2048.jpg
xplanet -make_cloud_maps -tmpdir /home/cochrane/.xplanet/cloud_maps/
