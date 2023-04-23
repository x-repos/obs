#!/bin/sh
#####
#	A line starting with an initial # is a comment. 
#	I use comments a lot to document scripts so that I know what I did

#	when I look at them later

#####

#####
#	This script will get ray parameters for a given source depth and epicentral distance

#	in degrees from the program udtdd

#####

#####
#	define event depth as a shell variable - note no spaces are permitted

#####
EVDP=100
#####
#	loop over epicentral distances
#####
for GCARC in 30 40 50 60 70 80 90
do
	RAYP=`udtdd -GCARC ${GCARC} -EVDP ${EVDP}`
	#####
	# the desired ray parameter is placed in the shell variable RAYP
	# we can use this value later. Note that the command syntax is -GCARC distance_degrees
	# The ${GCARC} places the value from the for loop into the proper position
	#####

	#####
	# now list the results using the echo command
	#####
	echo ${GCARC} ${EVDP} ${RAYP}
done
