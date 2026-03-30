TARGET = Qt$${QT_MAJOR_VERSION}Feedback
QT = core
TEMPLATE = lib
CONFIG += create_pc create_prl

MODULE_PLUGIN_TYPES = \
    feedback

PUBLIC_HEADERS += qfeedbackglobal.h \
                  qfeedbackactuator.h \
                  qfeedbackeffect.h \
                  qfeedbackplugininterfaces.h \
                  qfeedbackpluginsearch.h

PRIVATE_HEADERS += qfeedbackeffect_p.h \
                   qfeedbackplugin_p.h

HEADERS =  $$PUBLIC_HEADERS $$PRIVATE_HEADERS

SOURCES += qfeedbackactuator.cpp \
           qfeedbackeffect.cpp \
           qfeedbackplugin.cpp

public_headers.files = $$PUBLIC_HEADERS
public_headers.path = /usr/include/qt$${QT_MAJOR_VERSION}/QtFeedback

target.path = $$[QT_INSTALL_LIBS]

pkgconfig.files = $$TARGET.pc
pkgconfig.path = $$target.path/pkgconfig

QMAKE_PKGCONFIG_NAME = lib$$TARGET
QMAKE_PKGCONFIG_DESCRIPTION = Qt Feedback module
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_INCDIR = $$public_headers.path
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
QMAKE_PKGCONFIG_REQUIRES = Qt$${QT_MAJOR_VERSION}Core
QMAKE_PKGCONFIG_VERSION = $$VERSION

INSTALLS += \
        public_headers \
        target \
        pkgconfig
