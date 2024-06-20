#!/bin/bash                                                                            
echo "`hostname` - # START - at `date +%d.%m.%Y_%H:%M`"                                
                                                                                       
                                                                                       
LOG_DIR="/opt/odw-tomcat-server/logs"                                                  
LOG_FILES=$(find $LOG_DIR -type f -mtime +730 -name "*.log")                           
chmod 777 . $LOG_FILES                                                                 
echo $LOG_FILES                                                                        
rm -r -f $LOG_FILES||true                                                              
LOG_FILES=$(find $LOG_DIR -type f -mtime +730 -name "*.out")                           
chmod 777 .  $LOG_FILES                                                                
echo $LOG_FILES                                                                        
rm -r -f $LOG_FILES||true                                                              
LOG_DIR="/opt/odw-apache-tomcat-7.0.56/logs"                                           
LOG_FILES=$(find $LOG_DIR -type f -mtime +730 -name "*.log")                           
chmod 777 . $LOG_FILES                                                                 
echo $LOG_FILES                                                                        
rm -r -f $LOG_FILES||true                                                              
LOG_FILES=$(find $LOG_DIR -type f -mtime +730 -name "*.out")                           
chmod 777 .  $LOG_FILES                                                                
echo $LOG_FILES                                                                        
rm -r -f $LOG_FILES||true                                                              
echo "`hostname` - # STOP - at `date +%d.%m.%Y_%H:%M`"
