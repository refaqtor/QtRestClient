#-------------------------------------------------
#
# Project created by QtCreator 2017-03-07T17:27:21
#
#-------------------------------------------------

load(qrestbuilder)

QT       += core gui widgets restclient

TARGET = JsonPlaceholderApi
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS


SOURCES += main.cpp\
		mainwindow.cpp

HEADERS  += mainwindow.h

FORMS    += mainwindow.ui

REST_API_OBJECTS += post.json
REST_API_CLASSES += api.json \
	api_posts.json

target.path = $$[QT_INSTALL_EXAMPLES]/restclient/JsonPlaceholderApi
INSTALLS += target

#not found by linker?
unix:!mac {
	LIBS += -L$$OUT_PWD/../../../lib #required to make this the first place to search
	LIBS += -L$$[QT_INSTALL_LIBS] -licudata
	LIBS += -L$$[QT_INSTALL_LIBS] -licui18n
	LIBS += -L$$[QT_INSTALL_LIBS] -licuuc
}

#add lib dir to rpath
mac: QMAKE_LFLAGS += '-Wl,-rpath,\'$$OUT_PWD/../../../lib\''
