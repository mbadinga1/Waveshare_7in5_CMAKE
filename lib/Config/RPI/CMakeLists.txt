#include current files
set(F_SOURCES DEV_Config.c dev_hardware_SPI.c)
add_library(${LIB_CONFIG} SHARED ${F_SOURCES} Debug.h)
target_include_directories(${LIB_CONFIG} PUBLIC "./")

# find_package(PkgConfig REQUIRED)
# pkg_check_modules(LIBGPIOD REQUIRED libgpiod)
# target_include_directories(${LIB_CONFIG} PUBLIC ${LIBGPIOD_INCLUDE_DIRS})
# target_link_libraries(${LIB_CONFIG} PUBLIC ${LIBGPIOD_LIBRARIES})

# options 
# option(DEV_LIB TRUE)
# add_definitions(-DUSE_BCM2835_LIB)

