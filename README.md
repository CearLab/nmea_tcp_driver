# nmea_tcp_driver

nmea_tcp_driver is a ROS driver to parse NMEA strings and publish standard ROS NavSat message types from TCP input. it does not require the GPSD daemon to be running. This is a modification of the nmea_navsat_driver project (http://ros.org/wiki/nmea_navsat_driver
) to work with GPS systems that transmit solutions through TCP, like the Reach RTK GPS (https://emlid.com/reach/). This project does not take ownership of the nmea_navsat_driver project as detailed in the license, and it does not take ownership of the Reach RTK GPS.

### Version
1.0

### Tested On

  - Linux Ubuntu 14.04.1 LTS
  - Kernel 4.2.0
  - ROS Indigo
  - Reach RTK GPS

### Installation

To install nmea_tcp_driver, clone the github repo into a catkin workspace and catkin_make as so:

    cd ~/catkin_ws/src/
    git clone https://github.com/CearLab/nmea_tcp_driver.git
    cd ~/catkin_ws
    source devel/setup.bash
    catkin_make
    
### Usage

First, make sure your device is publishing nmea messages through TCP to a certain port in your network. Output solutions to a tcpsvr with a certain port number (as so: https://docs.emlid.com/reach/quickstart/#setting-up-rover). The default port number for the nmea_tcp_driver is 12346. This port output number can be configured in the Reachview App config tab of the rover. The Reach output solution format must be set to nmea.

To output TCP solutions through the USB connection on the Reach RTK, follow this guide: https://docs.emlid.com/reach/software-development/#using-ethernet-over-usb

After the GPS correctly outputs the nmea data to a TCP server, begin the ros topic. To create the ros topic that publishes the processed nmea messages, issue the following command:

    rosrun nmea_tcp_driver nmea_tcp_driver
    
Then run rostopic list, and the following topics should be present (provided a proper ros master is running):

    /tcpfix
    /tcpvel
    /tcptime_reference
    
### ROS Parameters

    ~host (string, default: 'reach.local')
         The host (GPS) to which the code will try to connect and receive TCP messaged from
    
    ~port (int, default: 12346)    
        The port number for the TCP connection 
    
    
### Notes

- The ifconfig.sh file in the /scripts folder is used to fix a network manager issue some computers might have when mainting USB TCP connection with the Reach RTK. We witnessed this issue in only one of three computers, and it was not a large issue but is worth fixing. The ifconfig.sh script simply infinitely calls the "sudo ifconfig usb0 192.168.2.2" command so that any disconnections can be quickly reconnected. To run it, open a new terminal, move to the scripts folder, and run ./ifconfig.sh .
- Some computers have issues when attempting to connect to the reach.local host (default), so if connection issues are encountered, try running nmea_tcp_driver with the host number passed as a parameter, EX: "rosrun nmea_tcp_driver nmea_tcp_driver host=192.168.2.15"
- The status numbers have the following correlations:     "0 = NO_FIX, 1 = FIX, 2 = SBAS_FIX, 4/5 = GBAS_FIX"

API
---

This package has no released Code API.

