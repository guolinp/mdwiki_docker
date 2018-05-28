FROM tomcat:9-jre8
MAINTAINER Pan Guolin "13661440134@163.com"


#ENVIRONMENT VARIABLES CONFIGURATION
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV CATALINA_BASE /usr/local/tomcat
ENV CATALINA_TMPDIR /usr/local/tomcat/temp
ENV JRE_HOME /usr
ENV CLASSPATH /usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar


# custom deployment to / with redirect from /source
RUN rm -rf /usr/local/tomcat/webapps/* && \
    mkdir /webapp && \
    ln -s /webapp /usr/local/tomcat/webapps/ROOT

# disable all file logging
ADD logging.properties /usr/local/tomcat/conf/logging.properties
RUN sed -i -e 's/Valve/Disabled/' /usr/local/tomcat/conf/server.xml

# add our scripts
ADD scripts /scripts
RUN chmod -R +x /scripts

# run
WORKDIR $CATALINA_HOME
EXPOSE 8080

CMD ["/scripts/start.sh"]
