#!/bin/bash

cp $1.pas $1.bak
env DD_EINGABE=$1.bak \
    DD_AUSGABE=$1.pas \
    DD_LISTING=$1.lis \
    pcint \
    pcode=beautify.pcode \
    inc=paslibx,passcan \
    pas=beautify.pas \
    out=beautify.lis \
    debug=n
