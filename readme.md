Example running Waveshare 7in5 with cmake
(this can be update base on your support screen)

Required : 
- Waveshare 7in5 connecting with Raspberry (0 or 4 tested)
- Installed Library of GPIO suggested by waveshare : 
	- bcm2835 (set on my example in app/CMakeLists.txt line 15)
	- wiringPi (follow same path for bcm2835 in this CMakeLists)
- install cmake minimum VERSION 3.23 or change it to the main CMakeLists.txt

Installation:
All command run in raspberry and I used sudo as recommended by waveshare
- open a terminal in root of the project
- mkdir build && cd build
- sudo cmake ..
- sudo make 
- sudo ./app/Executable (launch the main)


Where to find library .so or .a ? 
look in build directory and search in every library.

