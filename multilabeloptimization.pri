DEFINES += MULTI_LABEL_OPTIMIZATION_INCLUDED

win32 {
    DEFINES+=NOMINMAX
}

HEADERS += \
    $$PWD/block.h \
    $$PWD/energy.h \
    $$PWD/GCoptimization.h \
    $$PWD/graph.h \
    $$PWD/LinkedBlockList.h

SOURCES += \
    $$PWD/GCoptimization.cpp \
    $$PWD/graph.inl \
    $$PWD/LinkedBlockList.cpp \
    $$PWD/maxflow.inl

DISTFILES += \
    $$PWD/GCO_README.TXT
