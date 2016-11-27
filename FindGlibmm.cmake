# Try to find Glibmm
# Released under MIT License by Kota Weaver
# Once done this will define
#  GLIBMM_FOUND - System has Glibmm
#  GLIBMM_INCLUDE_DIRS - The Glibmm include directories
#  GLIBMM_LIBRARIES - The libraries needed to use Glibmm
#  GLIBMM_DEFINITIONS - Compiler switches required for using Glibmm

find_package(PkgConfig)
find_package(Glib)
pkg_check_modules(PC_GLIBMM QUIET glibmm-2.4)
set(GLIBMM_DEFINITIONS ${PC_GLIBMM_CFLAGS_OTHER})
find_path(GLIBMM_INCLUDE_DIR glibmm.h
  HINTS ${PC_GLIBMM_INCLUDEDIR} ${PC_GLIBMM_INCLUDE_DIRS})
find_path(GLIBMMCONFIG_INCLUDE_DIR glibmmconfig.h
  HINTS ${PC_GLIBMM_INCLUDEDIR} ${PC_GLIBMM_INCLUDE_DIRS})
find_library(GLIBMM_LIBRARY NAMES glibmm-2.4
  HINTS ${PC_GLIBMM_LIBDIR} ${PC_GLIBMM_LIBRARY_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GLIBMM DEFAULT_MSG
  GLIBMM_LIBRARY GLIBMM_INCLUDE_DIR)
mark_as_advanced(GLIBMM_INCLUDE_DIR GLIBMM_LIBRARY)
set(GLIBMM_LIBRARIES ${GLIBMM_LIBRARY} ${GLIB_LIBRARIES})
set(GLIBMM_INCLUDE_DIRS ${GLIBMM_INCLUDE_DIR} ${GLIBMMCONFIG_INCLUDE_DIR} ${GLIB_INCLUDE_DIRS})
