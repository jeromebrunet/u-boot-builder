#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Quick and dirty packing script for concourse CI

#1 is the u-boot directory
#2 is the fip directory
#3 is the out directory
#4 is the platform name

# Get the git version
pushd $1
GITVERS=`git describe --always`
popd

# Generate the atf
$2/generate-bins.sh $2 $1/u-boot.bin $3 atf.bin

# make the release tarball
pushd $3
OUTNAME="atf-$4-$GITVERS"
mkdir $OUTNAME
cp atf.bin* $OUTNAME
tar czf $OUTNAME.tar.gz $OUTNAME
popd
