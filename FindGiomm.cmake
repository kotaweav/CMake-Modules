# Try to find Giomm
# Released under MIT License by Kota Weaver
# Once done this will define
#  GIOMM_FOUND - System has Giomm
#  GIOMM_INCLUDE_DIRS - The Giomm include directories
#  GIOMM_LIBRARIES - The libraries needed to use Giomm
#  GIOMM_DEFINITIONS - Compiler switches required for using Giomm

find_package(PkgConfig)
pkg_check_modules(PC_GIOMM QUIET giomm-2.4)
set(GIOMM_DEFINITIONS ${PC_GIOMM_CFLAGS_OTHER})
find_path(GIOMM_INCLUDE_DIR giomm.h
  HINTS ${PC_GIOMM_INCLUDEDIR} ${PC_GIOMM_INCLUDE_DIRS})
find_path(GIOMMCONFIG_INCLUDE_DIR giommconfig.h
  HINTS ${PC_GIOMM_INCLUDEDIR} ${PC_GIOMM_INCLUDE_DIRS})
find_library(GIOMM_LIBRARY NAMES giomm-2.4
  HINTS ${PC_GIOMM_LIBDIR} ${PC_GIOMM_LIBRARY_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GIOMM DEFAULT_MSG
  GIOMM_LIBRARY GIOMM_INCLUDE_DIR)
mark_as_advanced(GIOMM_INCLUDE_DIR GIOMM_LIBRARY)
set(GIOMM_LIBRARIES ${GIOMM_LIBRARY})
set(GIOMM_INCLUDE_DIRS ${GIOMM_INCLUDE_DIR})
