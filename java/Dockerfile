# vim: set ft=dockerfile:                                                                                                
FROM ubuntu:18.04                                                                                                        
                                                                                                                         
ENV SDKMAN_DIR="/opt/sdkman"                                                                                             
                                                                                                                         
RUN set -eux; \                                                                                                          
apt-get -q update; \                                                                                                     
apt-get -qy upgrade; \                                                                                                   
apt-get -qy dist-upgrade; \                                                                                              
apt-get -qy install unzip zip curl; \                                                                                    
apt-get clean; \                                                                                                         
rm -rf /var/lib/apt/lists; \                                                                                             
curl -s "https://get.sdkman.io" | bash                                                                                   
                                                                                                                         
COPY sdkman.config ${SDKMAN_DIR}/etc/config                                                                        
                                                                                                                         
ENV ORACLE_JDK_VERSION="8.0.201"                                                                                         
                                                                                                                         
SHELL [ "bash", "-c" ]                                                                                                   
                                                                                                                         
RUN set -e; \                                                                                                            
source "${SDKMAN_DIR}/bin/sdkman-init.sh"; \                                                                             
yes | sdk install java "${ORACLE_JDK_VERSION}-oracle"; \                                                                 
sdk flush broadcast; \                                                                                                   
sdk flush archives; \                                                                                                    
sdk flush temp                                                                                                           
                                                                                                                         
COPY entrypoint.sh /entrypoint.sh                                                                             
                                                                                                                         
ENTRYPOINT ["/entrypoint.sh"]          
