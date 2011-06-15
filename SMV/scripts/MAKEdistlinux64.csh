#!/bin/csh -f
set version=$1
set revision=$2
set SVNROOT=~/FDS-SMV

set SMOKEVIEWDIR=$SVNROOT/SMV/bin
set SMOKEZIPDIR=$SVNROOT/Utilities/smokezip/intel_linux_64
set SMOKEDIFFDIR=$SVNROOT/Utilities/smokediff/intel_linux_64
set FORBUNDLE=$SVNROOT/SMV/for_bundle
set LINUXDIR=smv_$version\_linux64

cd $FORBUNDLE

rm -rf $LINUXDIR
mkdir -p $LINUXDIR
mkdir -p $LINUXDIR/Documentation
cp readme.html $LINUXDIR/Documentation/release_notes.html
cp $FORBUNDLE/objects.svo $LINUXDIR/.
cp $SMOKEDIFFDIR/smokediff_linux_64 $LINUXDIR/.
cp $SMOKEVIEWDIR/smv5_linux_64 $LINUXDIR/.
cp $SMOKEZIPDIR/smokezip_linux_64 $LINUXDIR/.
rm -f $LINUXDIR.tar $LINUXDIR.tar.gz
tar cvf $LINUXDIR.tar $LINUXDIR/.
gzip $LINUXDIR.tar
