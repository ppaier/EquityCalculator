#-------------------------------------------------
#
# Project created by QtCreator 2013-03-16T08:58:33
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = EquityCalcs
TEMPLATE = app

QMAKE_CXXFLAGS += -std=c++11


SOURCES += main.cpp\
        MainWindow.cpp \
    EqCalculator.cpp \
    CalculationMethod.cpp \
    Method3BetEV.cpp \
    MethodOpenEV.cpp \
    Methods.cpp \
    GuiObjects.cpp \
    Positions.cpp \
    Method4BetEV.cpp \
    Method5BetEV.cpp \
    MethodOpenBE.cpp \
    Method3BetBE.cpp \
    Method4BetBE.cpp \
    Method5BetBE.cpp

HEADERS  += MainWindow.hpp \
    EqCalculator.hpp \
    GuiObjects.hpp \
    CalculationMethod.hpp \
    Method3BetEV.hpp \
    MethodOpenEV.hpp \
    Methods.hpp \
    Positions.hpp \
    Method4BetEV.hpp \
    Method5BetEV.hpp \
    MethodOpenBE.hpp \
    Method3BetBE.hpp \
    Method4BetBE.hpp \
    Method5BetBE.hpp

FORMS    += MainWindow.ui

RESOURCES += \
    Icon.qrc
