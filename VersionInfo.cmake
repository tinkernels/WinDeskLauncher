# Version metadata
set(APP_RELEASE_VERSION_STRING "1.0.0")
set(APP_DESCRIPTION_STR "Windows Desktop App Launcher")
set(APP_LICENSE_STR "MIT")
set(APP_COPYRIGHT_STR "Copyright (c) 2022 Don Johnny.")
set(APP_INTERNAL_NAME_STR "WinDeskLauncher")
set(APP_INFO_WEB_URL "https://github.com/tinkernels/WinDeskLauncher")
set(APP_COMPANY_STR "-")

# Parse version tweaks
set(APP_RELEASE_VERSION_REGEX "^([0-9]+)\\.([0-9]+)\\.([0-9]+)([-]rc[-]|\\.)?([0-9]*)$")
string(REGEX REPLACE     "${APP_RELEASE_VERSION_REGEX}" "\\1"
  APP_RELEASE_VERSION_MAJOR "${APP_RELEASE_VERSION_STRING}")
string(REGEX REPLACE     "${APP_RELEASE_VERSION_REGEX}" "\\2"
  APP_RELEASE_VERSION_MINOR "${APP_RELEASE_VERSION_STRING}")
string(REGEX REPLACE     "${APP_RELEASE_VERSION_REGEX}" "\\3"
  APP_RELEASE_VERSION_PATCH "${APP_RELEASE_VERSION_STRING}")
string(REGEX REPLACE     "${APP_RELEASE_VERSION_REGEX}" "\\5"
  APP_RELEASE_VERSION_PRERELEASE "${APP_RELEASE_VERSION_STRING}")

message(STATUS "APP_RELEASE_VERSION_PRERELEASE: ${APP_RELEASE_VERSION_PRERELEASE}")

# Package version
set(APP_RELEASE_VERSION
  "${APP_RELEASE_VERSION_MAJOR}.${APP_RELEASE_VERSION_MINOR}.${APP_RELEASE_VERSION_PATCH}")

if(APP_RELEASE_VERSION_PRERELEASE)
  set(APP_RELEASE_VERSION "${APP_RELEASE_VERSION}.${APP_RELEASE_VERSION_PRERELEASE}")
else()
  set(APP_RELEASE_VERSION "${APP_RELEASE_VERSION}.0")
endif()
message(STATUS "APP_RELEASE_VERSION: ${APP_RELEASE_VERSION}")

if (MSVC)
  string(REPLACE "." ","  APP_RELEASE_RC_VERSION "${APP_RELEASE_VERSION}")
  message(STATUS "APP_RELEASE_RC_VERSION: ${APP_RELEASE_RC_VERSION}")

  # use English language (0x409) in resource compiler
  string(APPEND CMAKE_RC_FLAGS " -l0x409")

  # Generate the version.rc file used elsewhere.
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/version.rc.in ${CMAKE_CURRENT_BINARY_DIR}/version.rc @ONLY)
  set(APP_VERSION_RC_FILE ${CMAKE_CURRENT_BINARY_DIR}/version.rc)
endif()