# Try to find Glib
# Released under MIT License by Kota Weaver
# Once done this will define
#  GLIB_FOUND - System has Glib
#  GLIB_INCLUDE_DIRS - The Glib include directories
#  GLIB_LIBRARIES - The libraries needed to use Glib
#  GLIB_DEFINITIONS - Compiler switches required for using Glib

find_package(PkgConfig)
pkg_check_modules(PC_GLIB QUIET glib-2.0)
set(GLIB_DEFINITIONS ${PC_GLIB_CFLAGS_OTHER})
find_path(GLIB_INCLUDE_DIR glib.h
  HINTS ${PC_GLIB_INCLUDEDIR} ${PC_GLIB_INCLUDE_DIRS})
find_path(GLIBCONFIG_INCLUDE_DIR glibconfig.h
  HINTS ${PC_GLIB_INCLUDEDIR} ${PC_GLIB_INCLUDE_DIRS})
message("glibconfig stuff " ${GLIBCONFIG_INCLUDE_DIR})
find_library(GLIB_LIBRARY NAMES glib-2.0
  HINTS ${PC_GLIB_LIBDIR} ${PC_GLIB_LIBRARY_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLIB DEFAULT_MSG
  GLIB_LIBRARY GLIB_INCLUDE_DIR)
mark_as_advanced(GLIB_INCLUDE_DIR GLIB_LIBRARY)
set(GLIB_LIBRARIES ${GLIB_LIBRARY})
set(GLIB_INCLUDE_DIRS ${GLIB_INCLUDE_DIR} ${GLIBCONFIG_INCLUDE_DIR})
