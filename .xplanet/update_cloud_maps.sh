#!/bin/bash

echo "Fetching new cloud maps"
wget http://xplanetclouds.com/free/local/clouds_2048.jpg -O ~/.xplanet/cloud_maps/clouds_2048.jpg
echo "Preparing cloud maps for xplanet"
xplanet -make_cloud_maps -tmpdir /home/cochrane/.xplanet/cloud_maps/
