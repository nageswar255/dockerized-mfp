## Setup
 You either download mobile first dev kit (mobilefirst-deved-devkit-linux-8.0.0.0.bin) and add it to current folder (comment line 25), or just uncomment line 25 and comment line 27 

## Run
 sudo service docker start
 sudo sysctl -w vm.max_map_count=262144
 sudo chmod -R 777 .
 sudo docker-compose up


## Server root path
 /root/MobileFirst-8.0.0.0
## Server logs path
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/logs
## server.xml path
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/server.xml
## Resources
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/resources
## Apps
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/apps
## bootstrap.properties 
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/bootstrap.properties
## jvm.options
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/jvm.options
## databases
 /root/MobileFirst-8.0.0.0/mfp-server/databases
## analytics
 /root/MobileFirst-8.0.0.0/mfp-server/usr/servers/mfp/analyticsData