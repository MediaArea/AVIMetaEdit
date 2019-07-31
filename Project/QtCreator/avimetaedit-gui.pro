QT       += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

win32|macx {
TARGET = "AVI MetaEdit"
} else {
TARGET = "avimetaedit-gui"
}

win32 {
    RC_FILE = avimetaedit-gui.rc
    contains(QT_ARCH, i386): DESTDIR = Win32
    contains(QT_ARCH, x86_64): DESTDIR = x64
}

macx {
    LIBS += -framework CoreFoundation
    QMAKE_INFO_PLIST = ../Mac/Info.plist
    ICON = ../Mac/Logo.icns

    contains(MACSTORE, yes|1) {
        QMAKE_CFLAGS += -gdwarf-2
        QMAKE_CXXFLAGS += -gdwarf-2
        QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.9
    }
}

unix {
    isEmpty(BINDIR): BINDIR = /usr/bin
    target.path = $$BINDIR
    INSTALLS += target
}

TEMPLATE = app

CONFIG += qt release
CONFIG += no_keywords

DEFINES += TIXML_USE_STL _LARGE_FILES _FILE_OFFSET_BITS=64

HEADERS = \
    ../../Source/FromMediaInfo/FromMediaInfo.h \
    ../../Source/GUI/Qt/App.h \
    ../../Source/GUI/Qt/GUI_About.h \
    ../../Source/GUI/Qt/GUI_Help.h \
    ../../Source/GUI/Qt/GUI_Main.h \
    ../../Source/GUI/Qt/GUI_Main_Core_Table.h \
    ../../Source/GUI/Qt/GUI_Main_Core_Text.h \
    ../../Source/GUI/Qt/GUI_Main_Output_Log.h \
    ../../Source/GUI/Qt/GUI_Main_Output_Trace.h \
    ../../Source/GUI/Qt/GUI_Main_Technical_Table.h \
    ../../Source/GUI/Qt/GUI_Main_Technical_Text.h \
    ../../Source/GUI/Qt/GUI_Main_UndoDialog.h \
    ../../Source/GUI/Qt/GUI_Main_xxxx_Loudness.h \
    ../../Source/GUI/Qt/GUI_Main_xxxx__Common.h \
    ../../Source/GUI/Qt/GUI_Main_xxxx_CodingHistoryDialog.h \
    ../../Source/GUI/Qt/GUI_Main_xxxx_DateDialog.h \
    ../../Source/GUI/Qt/GUI_Main_xxxx_TextEditDialog.h \
    ../../Source/GUI/Qt/GUI_Main_xxxx_TimeReferenceDialog.h \
    ../../Source/GUI/Qt/GUI_Preferences.h \
    ../../Source/Common/Common_About.h \
    ../../Source/Common/Core.h \
    ../../Source/Riff/Riff_Base.h \
    ../../Source/Riff/Riff_Chunks.h \
    ../../Source/Riff/Riff_Handler.h \
    ../../Source/ZenLib/BitStream.h \
    ../../Source/ZenLib/BitStream_LE.h \
    ../../Source/ZenLib/Conf.h \
    ../../Source/ZenLib/Conf_Internal.h \
    ../../Source/ZenLib/CriticalSection.h \
    ../../Source/ZenLib/Dir.h \
    ../../Source/ZenLib/File.h \
    ../../Source/ZenLib/FileName.h \
    ../../Source/ZenLib/InfoMap.h \
    ../../Source/ZenLib/int128s.h \
    ../../Source/ZenLib/int128u.h \
    ../../Source/ZenLib/MemoryDebug.h \
    ../../Source/ZenLib/OS_Utils.h \
    ../../Source/ZenLib/Thread.h \
    ../../Source/ZenLib/Trace.h \
    ../../Source/ZenLib/Translation.h \
    ../../Source/ZenLib/Utils.h \
    ../../Source/ZenLib/Ztring.h \
    ../../Source/ZenLib/ZtringList.h \
    ../../Source/ZenLib/ZtringListList.h \
    ../../Source/ZenLib/ZtringListListF.h \
    ../../Source/MD5/md5.h \
    ../../Source/TinyXml/tinystr.h \
    ../../Source/TinyXml/tinyxml.h

SOURCES = \
    ../../Source/FromMediaInfo/FromMediaInfo.cpp \
    ../../Source/GUI/Qt/App.cpp \
    ../../Source/GUI/Qt/GUI_About.cpp \
    ../../Source/GUI/Qt/GUI_Help.cpp \
    ../../Source/GUI/Qt/GUI_Main.cpp \
    ../../Source/GUI/Qt/GUI_Main_Core_Table.cpp \
    ../../Source/GUI/Qt/GUI_Main_Core_Text.cpp \
    ../../Source/GUI/Qt/GUI_Main_Menu.cpp \
    ../../Source/GUI/Qt/GUI_Main_Output_Log.cpp \
    ../../Source/GUI/Qt/GUI_Main_Output_Trace.cpp \
    ../../Source/GUI/Qt/GUI_Main_Technical_Table.cpp \
    ../../Source/GUI/Qt/GUI_Main_Technical_Text.cpp \
    ../../Source/GUI/Qt/GUI_Main_UndoDialog.cpp \
    ../../Source/GUI/Qt/GUI_Main_xxxx_Loudness.cpp \
    ../../Source/GUI/Qt/GUI_Main_xxxx__Common.cpp \
    ../../Source/GUI/Qt/GUI_Main_xxxx_CodingHistoryDialog.cpp \
    ../../Source/GUI/Qt/GUI_Main_xxxx_DateDialog.cpp \
    ../../Source/GUI/Qt/GUI_Main_xxxx_TextEditDialog.cpp \
    ../../Source/GUI/Qt/GUI_Main_xxxx_TimeReferenceDialog.cpp \
    ../../Source/GUI/Qt/GUI_Preferences.cpp \
    ../../Source/Riff/Riff_Chunks_AVIX.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_odml.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_odml_dmlh.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__movi_xxxx.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__movi___ix.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_avih.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_strl.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_strl_indx.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_strl_strf.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl_strl_strh.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__idx1.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__Tdat.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__Tdat_rn_A.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__Tdat_rn_O.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__Tdat_tc_A.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__Tdat_tc_O.cpp \
    ../../Source/Common/Common_About.cpp \
    ../../Source/Common/Core.cpp \
    ../../Source/Riff/Riff_Base.cpp \
    ../../Source/Riff/Riff_Base_Streams.cpp \
    ../../Source/Riff/Riff_Chunks_.cpp \
    ../../Source/Riff/Riff_Chunks_AVI_.cpp \
    ../../Source/Riff/Riff_Chunks_AVI___PMX.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__aXML.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__movi.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__JUNK.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__hdrl.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__INFO.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__INFO_xxxx.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__iXML.cpp \
    ../../Source/Riff/Riff_Chunks_AVI__MD5_.cpp \
    ../../Source/Riff/Riff_Handler.cpp \
    ../../Source/ZenLib/Conf.cpp \
    ../../Source/ZenLib/CriticalSection.cpp \
    ../../Source/ZenLib/Dir.cpp \
    ../../Source/ZenLib/File.cpp \
    ../../Source/ZenLib/FileName.cpp \
    ../../Source/ZenLib/InfoMap.cpp \
    ../../Source/ZenLib/int128s.cpp \
    ../../Source/ZenLib/int128u.cpp \
    ../../Source/ZenLib/MemoryDebug.cpp \
    ../../Source/ZenLib/OS_Utils.cpp \
    ../../Source/ZenLib/Thread.cpp \
    ../../Source/ZenLib/Translation.cpp \
    ../../Source/ZenLib/Utils.cpp \
    ../../Source/ZenLib/Ztring.cpp \
    ../../Source/ZenLib/ZtringList.cpp \
    ../../Source/ZenLib/ZtringListList.cpp \
    ../../Source/ZenLib/ZtringListListF.cpp \
    ../../Source/MD5/md5.c \
    ../../Source/TinyXml/tinystr.cpp \
    ../../Source/TinyXml/tinyxml.cpp \
    ../../Source/TinyXml/tinyxmlerror.cpp \
    ../../Source/TinyXml/tinyxmlparser.cpp

contains(MACSTORE, yes|1) {
    DEFINES           += MACSTORE
    HEADERS           += ../../Source/Common/Mac_Helpers.h
    OBJECTIVE_SOURCES += ../../Source/Common/Mac_Helpers.mm
    LIBS              += -framework Foundation
}

RESOURCES += \
    ../../Source/Resource/GUI_Main.qrc

INCLUDEPATH += $$PWD/../../Source
