# Define the executable
add_executable(${EXEC_NAME} main.c)

# Set compile options
target_compile_options(${EXEC_NAME} PRIVATE -g -O -ffunction-sections -fdata-sections)

# Set link options
target_link_options(${EXEC_NAME} PRIVATE -Wl,--gc-sections)

# Link with your custom libraries
target_link_libraries(${EXEC_NAME} PRIVATE ${LIB_EPD7in5} ${LIB_GUI} ${LIB_CONFIG})

# Set up the USELIB_RPI option if not already defined
if(NOT DEFINED USELIB_RPI)
    set(USELIB_RPI "USE_BCM2835_LIB" CACHE STRING "Choose the RPI library")
    set_property(CACHE USELIB_RPI PROPERTY STRINGS USE_BCM2835_LIB USE_WIRINGPI_LIB USE_LGPIO_LIB USE_DEV_LIB)
endif()

# Conditional library linking
if(USELIB_RPI STREQUAL "USE_BCM2835_LIB")
    find_library(BCM2835_LIBRARY bcm2835)
    if(NOT BCM2835_LIBRARY)
        message(FATAL_ERROR "BCM2835 library not found")
    endif()
    target_link_libraries(${EXEC_NAME} PRIVATE ${BCM2835_LIBRARY} m)
elseif(USELIB_RPI STREQUAL "USE_WIRINGPI_LIB")
    find_library(WIRINGPI_LIBRARY wiringPi)
    if(NOT WIRINGPI_LIBRARY)
        message(FATAL_ERROR "WiringPi library not found")
    endif()
    target_link_libraries(${EXEC_NAME} PRIVATE ${WIRINGPI_LIBRARY} m)
elseif(USELIB_RPI STREQUAL "USE_LGPIO_LIB")
    find_library(LGPIO_LIBRARY lgpio)
    if(NOT LGPIO_LIBRARY)
        message(FATAL_ERROR "LGPIO library not found")
    endif()
    target_link_libraries(${EXEC_NAME} PRIVATE ${LGPIO_LIBRARY} m)
elseif(USELIB_RPI STREQUAL "USE_DEV_LIB")
    find_library(GPIOD_LIBRARY gpiod)
    if(NOT GPIOD_LIBRARY)
        message(FATAL_ERROR "GPIOD library not found")
    endif()
    target_link_libraries(${EXEC_NAME} PRIVATE ${GPIOD_LIBRARY} m)
else()
    message(FATAL_ERROR "Invalid USELIB_RPI option: ${USELIB_RPI}")
endif()

# Add compile definitions based on the selected library
target_compile_definitions(${EXEC_NAME} PRIVATE ${USELIB_RPI})