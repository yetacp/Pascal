# Pascal

New Stanford Pascal Compiler

This is the new Stanford Pascal Compiler.
It runs on Windows, OS/2, Linux, MacOs and
probably on every other system that has a C Compiler,
because the generated P-Code is interpreted by the
P-Code interpreter PCINT.

It also runs on the IBM-Mainframe, on the operating systems
MVS and CMS (on Hercules) and on today's z/OS, too, although
limited to AMODE 24, at the moment. The P-Code is translated
to 370 machine code, there.

For more information, see the Stanford Pascal compiler website:
http://bernd-oppolzer.de/job9.htm
or the New Stanford Pascal compiler Facebook page:
https://www.facebook.com/StanfordPascal/



Unix and Linux (and other systems) users:

You will have to build the P-Code interpreter PCINT from the
source code first. The PCINT source code and all related files
are in the bin subdirectory. There is no makefile; simply compile
all the sources (.c, .h) in the bin subdirectory; the executable
should be named pcint.

After that, use the same subdirectories as the Windows users.
Script pp in subdirectory script_ix shows how to call the compiler,
and script prun calls the compiled P-Code files.

Stanford Pascal Files

PASCOMP  EXEC      A1  - new Compiler EXEC
PASFORM  EXEC      A1  - Pascal Formatter
PASLINK  EXEC      A1  - Pascal Linker
PASRUN   EXEC      A1  - Pascal Run EXEC
PASRUNC  EXEC      A1  - Pascal Run EXEC for the compiler
PASRUNS  EXEC      A1  - PASRUN, but with standard allocations
PASC370  EXEC      A1  - EXEC to run the PCODE to 370 translator
PASCAL   EXEC      A1  - total Compiler and PCODE translator EXEC
PASCAL   MESSAGES  A1  - Repository for error messages
XRUNPARM MODULE    A1  - CMS startup code for OS modules
PASCAL1  TEXT      A1  - Compiler
PASCAL2  TEXT      A1  - PCODE-Translator
PASFORM  TEXT      A1  - Pascal Formatter
PASLIBX  TEXT      A1  - Runtime library Pascal part
PASMAIN  TEXT      A1  - Runtime library Main program entry
PASMONN  TEXT      A1  - Runtime library Pascal monitor
PASSCAN  TEXT      A1  - Pascal compiler symbol scanner
PASSNAPC TEXT      A1  - Pascal SNAPSHOT for CMS
PASUTILS TEXT      A1  - Runtime library utility functions
XRUNPARM TEXT      A1  - CMS startup code (object version)
PASMATH  TXTLIB    A2  - Runtime library Fortran math lib
