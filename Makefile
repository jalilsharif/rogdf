
all: OGDF/src/Makevars OGDF/src/RcppExports.cpp

SOURCES=rogdf_wrapper.cpp rogdf.cpp convert.cpp
OBJECTS=rogdf_wrapper.o   rogdf.o   convert.o
OGDF_SRC_DIR := $(shell \
if [ -d OGDF/src/ogdf ]; then echo ogdf; \
elif [ -d OGDF/src/src ]; then echo src; \
elif [ -d OGDF/src/orig ]; then echo orig; \
else echo ogdf; fi)
OGDF/src/Makevars:
	cd OGDF/src/ && rm Makevars && touch Makevars && \
	echo "PKG_CPPFLAGS=-I." > Makevars && \
        printf "%s" "SOURCES=" >> Makevars && \
        find orig -name "*.cpp" | sed 's/$$/ \\/' | sed 's/^/  /' >> Makevars
	cd OGDF/src/ && echo " " $(SOURCES) >> Makevars
	cd OGDF/src/ && printf "%s" "OBJECTS=" >> Makevars && \
	find orig -name "*.cpp" | sed 's/.cpp$$/.o \\/' | sed 's/^/  /' \
	  >> Makevars
	cd OGDF/src/ && echo " " $(OBJECTS) >> Makevars

OGDF/src/RcppExports.cpp: OGDF/src/rogdf.h OGDF/src/rogdf.cpp
	R -e 'library(Rcpp); compileAttributes("OGDF")'
	touch OGDF/src/RcppExports.cpp
	touch OGDF/src/rogdf_wrapper.cpp

.PHONY: all OGDF/src/Makevars
