@rem echo off

rem --- Search binaries ---
set BPATH=
if exist "%~dp0\..\..\..\MediaArea-Utils-Binaries" set BPATH="%~dp0\..\..\..\MediaArea-Utils-Binaries"
if exist "%~dp0\..\..\MediaArea-Utils-Binaries" set BPATH="%~dp0\..\..\MediaArea-Utils-Binaries"
if "%BPATH%"=="" (
    echo "ERROR: binaries path not found"
    exit /b 1
)

@rem --- Clean up ---
del   AVIMetaEdit_GUI_Windows_i386.exe
del   AVIMetaEdit_GUI_Windows_i386_WithoutInstaller.7z
rmdir AVIMetaEdit_GUI_Windows_i386 /S /Q
mkdir AVIMetaEdit_GUI_Windows_i386


@rem --- Copying : Exe ---
copy  ..\Project\MSVC2017\GUI\Win32\Release\AVI_MetaEdit_GUI.exe AVIMetaEdit_GUI_Windows_i386\avimetaedit-gui.exe

@rem --- Copying : Information files ---
copy ..\License.html AVIMetaEdit_GUI_Windows_i386\
copy ..\History_GUI.txt AVIMetaEdit_GUI_Windows_i386\History.txt
copy ..\conformance_point_document.xsd AVIMetaEdit_GUI_Windows_i386\
copy ReadMe_GUI_Windows.txt AVIMetaEdit_GUI_Windows_i386\ReadMe.txt


rem --- Compressing Archive ---
cd AVIMetaEdit_GUI_Windows_i386\
%BPATH%\Windows\7-Zip\7z a -r -tzip -mx9 ..\AVIMetaEdit_GUI_Windows_i386_WithoutInstaller.zip *
cd ..

rem --- Installer ---
pushd %BPATH%\Windows\NSIS
makensis.exe "%~dp0\..\Source\Install\AVI_MetaEdit_GUI_Windows_i386.nsi"
popd

rem --- Clean up ---
if "%1"=="SkipCleanUp" goto SkipCleanUp
rmdir AVIMetaEdit_GUI_Windows_i386\ /S /Q
:SkipCleanUp
