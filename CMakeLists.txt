cmake_minimum_required(VERSION 2.8.3)
project(nmea_TCP_driver)

find_package(catkin REQUIRED COMPONENTS roslint)

catkin_python_setup()
catkin_package()

install(PROGRAMS
   scripts/nmea_TCO_driver
   scripts/nmea_topic_driver
   scripts/nmea_topic_TCP_reader
   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

# Check package for pep8 style, add a test to fail on violations.
roslint_python()
roslint_add_test()
