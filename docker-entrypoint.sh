#!/bin/bash
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 
# Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
#on va fixer un login et mdp admin

#if [[ -z $ADMIN_PASSWORD ]]; then
#	ADMIN_PASSWORD=$(date| md5sum | fold -w 8 | head -n 1)
#	echo "##########GENERATED ADMIN PASSWORD: $ADMIN_PASSWORD  ##########"
#fi

ADMIN_PASSWORD="glassfish"

echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd
echo "AS_ADMIN_NEWPASSWORD=${ADMIN_PASSWORD}" >> /tmp/glassfishpwd
asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1
asadmin start-domain
echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}" > /tmp/glassfishpwd
asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin
asadmin --user=admin stop-domain
rm /tmp/glassfishpwd
exec "$@"
