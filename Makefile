
all: OGDF/src/Makevars OGDF/src/RcppExports.cpp

SOURCES=rogdf_wrapper.cpp rogdf.cpp convert.cpp
OBJECTS=rogdf_wrapper.o   rogdf.o   convert.o
	
OGDF_SRC_DIR := $(shell \
if [ -d OGDF/src/ogdf ]; then echo ogdf; \
elif [ -d OGDF/src/src ]; then echo src; \
elif [ -d OGDF/src/orig ]; then echo orig; \
else echo ogdf; fi)

OGDF/src/Makevars:
	cd OGDF/src && rm -f Makevars && \
	{ \
	echo 'PKG_CPPFLAGS=-I. -DUSE_COIN -DCOIN_OSI_CLP'; \
	echo 'OGDF_SOURCE_DIR := $(OGDF_SRC_DIR)'; \
	echo 'SOURCES := $$(shell find $$(OGDF_SOURCE_DIR) -name "*.cpp")'; \
	echo 'OBJECTS := $$(SOURCES:.cpp=.o)'; \
	echo 'PKG_LIBS=-lOsiClp -lClp -lCoinUtils'; \
	} > Makevars

OGDF/src/RcppExports.cpp: OGDF/src/rogdf.h OGDF/src/rogdf.cpp
	R -e 'library(Rcpp); compileAttributes("OGDF")'
	touch OGDF/src/RcppExports.cpp
	touch OGDF/src/rogdf_wrapper.cpp

.PHONY: all OGDF/src/Makevars
