bin_PROGRAMS = wolve

wolve_SOURCES = \
WolveEngine.cpp \
WolveMain.cpp \
WolvePlayer.cpp

noinst_HEADERS = \
WolveEngine.hpp \
WolvePlayer.hpp

wolve_LDADD = \
../commonengine/libcommonengine.a \
../solver/libsolver.a \
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

wolve_DEPENDENCIES = \
../util/libutil.a \
../hex/libhex.a \
../book/libbook.a \
../solver/libsolver.a \
../commonengine/libcommonengine.a \
$(FUEGO_BUILD)/smartgame/libfuego_smartgame.a \
$(FUEGO_BUILD)/gtpengine/libfuego_gtpengine.a

wolve_LDFLAGS = $(BOOST_LDFLAGS)

wolve_CPPFLAGS = \
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
