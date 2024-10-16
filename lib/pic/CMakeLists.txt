# aux_source_directory("./" F_SOURCES)
# Find the libgpiod package
# option(RPI TRUE)
# option(DEBUG TRUE)
option(USE_DEV_LIB TRUE)

#for macro
add_definitions(-DRPI)
# add_definitions(-DUSE_BCM2835_LIB)
add_definitions(-DUSE_DEV_LIB)
add_definitions(-DDEBUG)

if (USE_DEV_LIB)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(LIBGPIOD REQUIRED libgpiod)
    include_directories(${LIBGPIOD_INCLUDE_DIRS})
    set(USELIB_RPI ${LIBGPIOD_LIBRARIES})
    target_compile_definitions(${PROJECT_NAME} PUBLIC ${LIBGPIOD_LIBRARIES})
elseif(USE_BCM2835_LIB)
    find_library(BCM2835_LIB bcm2835 REQUIRED)
    find_path(BCM2835_INCLUDE bcm2835.h REQUIRED)
    include_directories(${BCM2835_INCLUDE})
    set(USELIB_RPI ${BCM2835_LIB})
    target_compile_definitions(${PROJECT_NAME} PUBLIC USE_BCM2835_LIB)
endif()

set(F_SOURCES DEV_Config.c dev_hardware_SPI.c RPI_gpiod.c)

add_library(${LIB_CONFIG} SHARED ${F_SOURCES} Debug.h)
target_include_directories(${LIB_CONFIG} PUBLIC "./")

target_link_libraries(${LIB_CONFIG} PUBLIC ${USELIB_RPI})