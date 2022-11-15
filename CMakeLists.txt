# CMakeList.txt : CMake project for WinDeskLauncher, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project ("WinDeskLauncher")

# set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /SUBSYSTEM:WINDOWS")

include(VersionInfo.cmake)
# Add source to this project's executable.
add_executable (WinDeskLauncher WIN32 WinDeskLauncher.cpp WinDeskLauncher.h WinDeskLauncher.rc ${APP_VERSION_RC_FILE})
