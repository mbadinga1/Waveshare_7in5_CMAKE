find_path(LG_INCLUDE_DIR lg.h
    HINTS /usr/include
)

find_library(LG_LIBRARY
    NAMES lg
    HINTS /usr/local/lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(lg DEFAULT_MSG
    LG_LIBRARY LG_INCLUDE_DIR)

if(LG_FOUND)
    set(LG_LIBRARIES ${LG_LIBRARY})
    set(LG_INCLUDE_DIRS ${LG_INCLUDE_DIR})
endif()

mark_as_advanced(LG_INCLUDE_DIR LG_LIBRARY)