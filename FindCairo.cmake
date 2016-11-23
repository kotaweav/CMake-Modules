# Try to find Cairo
# Released under MIT License by Kota Weaver
# Once done this will define
#  CAIRO_FOUND - System has Cairo
#  CAIRO_INCLUDE_DIRS - The Cairo include directories
#  CAIRO_LIBRARIES - The libraries needed to use Cairo
#  CAIRO_DEFINITIONS - Compiler switches required for Cairo

find_package(PkgConfig)
pkg_check_modules(PC_CAIRO QUIET cairo)
set(CAIRO_DEFINITONS ${PC_CAIRO_CFLAGS_OTHER})
find_path(CAIRO_INCLUDE_DIR cairo.h
  HINTS ${PC_CAIRO_INCLUDEDIR} ${PC_CAIRO_INCLUDE_DIRS})
find_library(CAIRO_LIBRARY NAMES cairo
  HINTS ${PC_CAIRO_LIBDIR} ${PC_CAIRO_LIBRARY_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CAIRO DEFAULT_MSG
  CAIRO_LIBRARY CAIRO_INCLUDE_DIR)
mark_as_advanced(CAIRO_INCLUDE_DIR CAIRO_LIBRARY)
set(CAIRO_LIBRARIES ${CAIRO_LIBRARY})
set(CAIRO_INCLUDE_DIRS ${CAIRO_INCLUDE_DIR})
