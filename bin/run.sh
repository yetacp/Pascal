#!/bin/bash

pcint pcode=$1.pcode \
      inc=paslibx,pasutils \
      pas=$1.pas \
      out=$1.pcodelis \
      debug=n
