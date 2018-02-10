p        hostname      node name
10.1.1.30 haproxy       haproxy
10.1.1.31 web-server    webserver
10.1.1.32 app-server    appserver
10.1.1.33 database      database

[root@work-station chef]# knife node list -E demo-env
appserver
database
haproxy
webserver


#!/bin/bash
vagrant destroy node-haproxy node-web-server node-app-server && vagrant up node-haproxy node-web-server node-app-server
knife bootstrap 10.1.1.30 -N haproxy -x vagrant -P vagrant --sudo && knife node from file nodes/haproxy.json && knife bootstrap 10.1.1.31 -N webserver -x vagrant -P vagrant --sudo && knife node from file nodes/webserver.json && knife bootstrap 10.1.1.32 -N appserver -x vagrant -P vagrant --sudo && knife node from file nodes/appserver.json
knife bootstrap 10.1.1.33 -N database -x vagrant -P vagrant --sudo && knife node from file nodes/database.json
