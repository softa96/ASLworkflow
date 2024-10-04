#! /bin/bash
################################################################################
# bash script for ASL registration. Written for Unix, FSL v6.0                 #
# Author: Sofie Tapper, IMT, Link\"oping University, sofie.tapper@liu.se       #
# February 2022                                                                #
################################################################################

# First argument is the path to the ASL data
# Second argument is the path to the structural image 
# Third argument is the path to the output directory
# Fourth argument is the path to the BET structural image

#   Set script variables and paths. Source FSL
set -x

mkdir -p $3

################################################################################

#       First, generate a skull stripped image in structural (anatomical) space
#       Check values of f (0-1, fractional intensity threshold). Smaller values - larger brain

asl_reg -i $1 -s $2 -o $3 --sbet $4 