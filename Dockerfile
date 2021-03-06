# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 
# Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
# 
# GlassFish on Docker with Oracle Linux and OpenJDK
FROM oraclelinux:7-slim

# Maintainer
MAINTAINER Arindam Bandyopadhyay<arindam.bandyopadhyay@oracle.com>

# Set environment variables and default password for user 'admin'
ENV GLASSFISH_PKG=glassfish-5.0-web.zip \
    GLASSFISH_URL=https://download.oracle.com/glassfish/5.0/release/glassfish-5.0-web.zip \
    GLASSFISH_HOME=/glassfish5 \
    MD5=66deb8024be5ce45059cca86ff2b88bc \
    PATH=$PATH:/glassfish5/bin \
    JAVA_HOME=/usr/lib/jvm/java-openjdk

# Install packages, download and extract GlassFish
# Setup password file
# Enable DAS
RUN yum -y install unzip java-1.8.0-openjdk-1.8.0.151-5.b12.el7_4 java-1.8.0-openjdk-devel-1.8.0.151-5.b12.el7_4 && \
    curl -O $GLASSFISH_URL && \
    echo "$MD5 *$GLASSFISH_PKG" | md5sum -c - && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG && \
    yum -y remove unzip && \
    rm -rf /var/cache/yum

COPY docker-entrypoint.sh /entrypoint.sh
# ligne ci-dessous rajoutée à adapter au nom de votre application
#COPY ROOT.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy
ENTRYPOINT ["/entrypoint.sh"]



# Ports being exposed
EXPOSE 4848 8080 8181

# Start asadmin console and the domain
CMD ["asadmin", "start-domain", "-v"]
