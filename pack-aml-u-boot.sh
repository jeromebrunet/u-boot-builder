#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# Quick and dirty packing script for concourse CI

#1 is the u-boot bl33
#2 is the fip directory
#3 is the out directory
#4 is the platform name
#5 is the version file

# Get the git version
GITVERS=`cat $5 | sed -e 's/[^A-Za-z0-9._-]/-/g'`


# Generate the atf
$2/generate-bins.sh $2 $1 $3 atf.bin

# make the release tarball
pushd $3
OUTNAME="atf-$4-$GITVERS"
mkdir $OUTNAME
cp atf.bin* $OUTNAME
tar czf $OUTNAME.tar.gz $OUTNAME
popd
