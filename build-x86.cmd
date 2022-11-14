@echo off
chcp 65001 >NUL 2>NUL

set ORIGINAL_CWD=%CD%
cd /D %~dp0

echo=
echo where is MSBuild.exe...
where MSBuild.exe 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo=
    echo where is CL.exe...
    where CL.exe 2>&1
    IF %ERRORLEVEL% EQU 0 (
        echo=
        echo where is LINK.exe...
        where LINK.exe 2>&1
            IF %ERRORLEVEL% EQU 0 (
                echo=
                echo Found MSBuild CL LINK
                goto ____skip_vsenv
        )
    )
)
echo=
echo setting visual studio env...
echo=
call "%~dp0\vsenv.cmd" 32
:____skip_vsenv

set CMAKE_GENERATOR_PARAM=
for /F "tokens=1 delims=." %%a in ('MSBuild -nologo -version') do (
    set MSVC_TOOLSET=%%a
)
if "%MSVC_TOOLSET%x"=="x" (
    echo MSVC_TOOLSET not found
) else (
    echo MSVC_TOOLSET %MSVC_TOOLSET%
    if "%MSVC_TOOLSET%"=="15" (
        set CMAKE_GENERATOR_PARAM=-G "Visual Studio 15 2017"
    )
    if "%MSVC_TOOLSET%"=="16" (
        set CMAKE_GENERATOR_PARAM=-G "Visual Studio 16 2019"
    )
    if "%MSVC_TOOLSET%"=="17" (
        set CMAKE_GENERATOR_PARAM=-G "Visual Studio 17 2022"
    )
)

set CMAKE_GENERATOR_PARAM=%CMAKE_GENERATOR_PARAM% -A Win32
echo=
echo CMAKE_GENERATOR_PARAM: %CMAKE_GENERATOR_PARAM%

mkdir build-x86

cmake %CMAKE_GENERATOR_PARAM% -S %CD% -B build-x86

devenv build-x86\WinDeskLauncher.sln /Build "MinSizeRel|Win32"