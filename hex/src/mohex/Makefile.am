bin_PROGRAMS = mohex

mohex_SOURCES = \
MoHexEngine.cpp \
MoHexMain.cpp \
MoHexPlayer.cpp

noinst_HEADERS = \
MoHexEngine.hpp \
MoHexPlayer.hpp

mohex_LDADD = \
../commonengine/libcommonengine.a \
../solver/libsolver.a \
../uct/libuct.a \
../book/libbook.a \
../hex/libhex.a \
../util/libutil.a \
$(FUEGO_BUILD)/smartgame/libfuego_smartgame.a \
$(FUEGO_BUILD)/gtpengine/libfuego_gtpengine.a \
$(DB_LIBS) \
$(BOOST_FILESYSTEM_LIB) \
$(BOOST_PROGRAM_OPTIONS_LIB) \
$(BOOST_SYSTEM_LIB) \
$(BOOST_THREAD_LIB)

mohex_DEPENDENCIES = \
../util/libutil.a \
../hex/libhex.a \
../book/libbook.a \
../solver/libsolver.a \
../commonengine/libcommonengine.a \
../uct/libuct.a \
$(FUEGO_BUILD)/smartgame/libfuego_smartgame.a \
$(FUEGO_BUILD)/gtpengine/libfuego_gtpengine.a

mohex_LDFLAGS = $(BOOST_LDFLAGS)

mohex_CPPFLAGS = \
$(BOOST_CPPFLAGS) \
-I$(FUEGO_ROOT)/smartgame \
-I$(FUEGO_ROOT)/gtpengine \
-I@top_srcdir@/src/ \
-I@top_srcdir@/src/util \
-I@top_srcdir@/src/hex \
-I@top_srcdir@/src/book \
-I@top_srcdir@/src/uct \
-I@top_srcdir@/src/solver \
-I@top_srcdir@/src/commonengine

DISTCLEANFILES = *~
