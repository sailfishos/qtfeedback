TEMPLATE = lib
QT = core qml
TARGET = declarative_feedback
MODULENAME = feedback
TARGETPATH = $$[QT_INSTALL_QML]/QtFeedback

INCLUDEPATH += ../../feedback
LIBS += -L$$OUT_PWD/../../feedback -lQt$${QT_MAJOR_VERSION}Feedback

CONFIG += \
        plugin \
        hide_symbols \
        link_pkgconfig

HEADERS += qdeclarativehapticseffect_p.h \
           qdeclarativefileeffect_p.h \
           qdeclarativethemeeffect_p.h \
           qdeclarativefeedbackactuator_p.h \
           qdeclarativefeedbackeffect_p.h

SOURCES += qdeclarativehapticseffect.cpp \
           qdeclarativefileeffect.cpp \
           plugin.cpp \
           qdeclarativethemeeffect.cpp \
           qdeclarativefeedbackactuator.cpp \
           qdeclarativefeedbackeffect.cpp

import.files = \
        plugins.qmltypes \
        qmldir

import.path = $$TARGETPATH

target.path = $$TARGETPATH

INSTALLS += \
        import \
        target

