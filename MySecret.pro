TEMPLATE = app
TARGET = MySecret
VERSION = 0.0.2

QT += qml quick core websockets webchannel
#webkitwidgets webchannel
#CONFIG += c++11 console
CONFIG += c++11

!osx:qtHaveModule(webengine) {
        QT += webengine
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}

SOURCES += GUI/main.cpp \
    GUI/core/cryptowrapper.cpp \
    GUI/webchannelobject/webchannelobject.cpp \
    GUI/websocketchannel/websocketclientwrapper.cpp \
    GUI/websocketchannel/websockettransport.cpp \
    lproxy/src/core/crypto/aes_crypto.cpp \
    lproxy/src/core/crypto/base64_crypto.cpp \
    lproxy/src/core/crypto/encryptor.cpp \
    lproxy/src/core/crypto/md5_crypto.cpp \
    lproxy/src/core/crypto/rc4_crypto.cpp \
    lproxy/src/core/crypto/rsa_crypto.cpp \
    lproxy/src/core/crypto/xor_crypto.cpp \
    lproxy/src/core/crypto/rc4.c

RESOURCES += \
    GUI/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


DISTFILES += \
    GUI/android-sources/AndroidManifest.xml

HEADERS += \
    GUI/core/cryptowrapper.h \
    GUI/webchannelobject/webchannelobject.h \
    GUI/websocketchannel/websocketclientwrapper.h \
    GUI/websocketchannel/websockettransport.h \
    lproxy/src/core/crypto/aes_crypto.h \
    lproxy/src/core/crypto/base64_crypto.h \
    lproxy/src/core/crypto/encryptor.h \
    lproxy/src/core/crypto/md5_crypto.h \
    lproxy/src/core/crypto/rc4.h \
    lproxy/src/core/crypto/rc4_crypto.h \
    lproxy/src/core/crypto/rsa_crypto.h \
    lproxy/src/core/crypto/xor_crypto.h

# include path
INCLUDEPATH += $$_PRO_FILE_PWD_/lproxy/contrib/cryptopp/ $$_PRO_FILE_PWD_/lproxy/src/core/

# Please modify the following statements by yourself
android {
        equals(ANDROID_TARGET_ARCH, x86) {
            LIBS += -L"$$_PRO_FILE_PWD_/libs/Androidx86" -lcryptopp
        } else: equals(ANDROID_TARGET_ARCH, armeabi-v7a) {
            LIBS += -L"$$_PRO_FILE_PWD_/libs/Androidarmeabiv7a" -lcryptopp
        } else {
            LIBS += -L"$$_PRO_FILE_PWD_/libs/Android" -lcryptopp
        }
        ANDROID_PACKAGE_SOURCE_DIR = $$PWD/GUI/android-sources
}
win32 {
        LIBS += -L"$$_PRO_FILE_PWD_/libs/MinGW32bit" -lcryptopp
        RC_ICONS = $$PWD/GUI/icon/64x64.ico
}


# Default rules for deployment.
include(deployment.pri)
