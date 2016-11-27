# Try to find SigC++
# Released under MIT License by Kota Weaver
# Once done this will define
#  SIGC++_FOUND - System has SigC++
#  SIGC++_INCLUDE_DIRS - The SigC++ include directories
#  SIGC++_LIBRARIES - The libraries needed to use SigC++
#  SIGC++_DEFINITIONS - Compiler switches required for using SigC++

find_package(PkgConfig)
pkg_check_modules(PC_SIGC++ QUIET sigc++-2.0)
set(SIGC++_DEFINITIONS ${PC_SIGC++_CFLAGS_OTHER})
find_path(SIGC++_INCLUDE_DIR sigc++/sigc++.h
  HINTS ${PC_SIGC++_INCLUDEDIR} ${PC_SIGC++_INCLUDE_DIRS})
find_path(SIGC++CONFIG_INCLUDE_DIR sigc++config.h
  HINTS ${PC_SIGC++_INCLUDEDIR} ${PC_SIGC++_INCLUDE_DIRS})
find_library(SIGC++_LIBRARY NAMES sigc-2.0
  HINTS ${PC_SIGC++_LIBDIR} ${PC_SIGC++_LIBRARY_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SIGC++ DEFAULT_MSG
  SIGC++_LIBRARY SIGC++_INCLUDE_DIR SIGC++CONFIG_INCLUDE_DIR)
mark_as_advanced(SIGC++_INCLUDE_DIR SIGC++CONFIG_INCLUDE_DIR SIGC++_LIBRARY)
set(SIGC++_LIBRARIES ${SIGC++_LIBRARY})
set(SIGC++_INCLUDE_DIRS ${SIGC++_INCLUDE_DIR} ${SIGC++CONFIG_INCLUDE_DIR})
