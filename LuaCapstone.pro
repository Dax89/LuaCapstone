TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += main.cpp \
    luacapstone.cpp \
    metadata.cpp \
    arch/x86.cpp \
    tables/arm_const.cpp \
    tables/arm64_const.cpp \
    tables/mips_const.cpp \
    tables/ppc_const.cpp \
    tables/sparc_const.cpp \
    tables/sysz_const.cpp \
    tables/x86_const.cpp \
    tables/xcore_const.cpp \
    tables/capstone_const.cpp \
    arch/arm64.cpp \
    arch/arm.cpp \
    arch/mips.cpp \
    arch/ppc.cpp \
    arch/sparc.cpp \
    arch/sysz.cpp \
    arch/xcore.cpp

unix:!macx: LIBS += -L$$PWD/lib/linux/ -lluajit-5.1 -ldl -lcapstone

INCLUDEPATH += $$PWD/include/luajit-2.0 \
               $$PWD/include/capstone

DEPENDPATH += $$PWD/include/luajit-2.0 \
              $$PWD/include/capstone

unix:!macx: PRE_TARGETDEPS += $$PWD/lib/linux/libluajit-5.1.a \
                              $$PWD/lib/linux/libcapstone.a

include(deployment.pri)
qtcAddDeployment()

HEADERS += \
    luacapstone.h \
    luacapstonemacros.h \
    reflection.h \
    metadata.h \
    arch/x86.h \
    tables/arm64_const.h \
    tables/arm_const.h \
    tables/mips_const.h \
    tables/ppc_const.h \
    tables/sparc_const.h \
    tables/sysz_const.h \
    tables/x86_const.h \
    tables/xcore_const.h \
    tables/capstone_const.h \
    arch/arm64.h \
    arch/arm.h \
    arch/mips.h \
    arch/ppc.h \
    arch/sparc.h \
    arch/sysz.h \
    arch/xcore.h

DISTFILES += \
    tests/test_mips.lua \
    tests/test_x86.lua \
    README.md \
    tests/test_iter.lua

