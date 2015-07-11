#!/bin/bash

curl --user admin:admin -H 'X-Requested-By:HortonworksUniversity' -X PUT http://node1:8080/api/v1/stacks/HDP/versions/2.2/operating_systems/redhat6/repositories/HDP-2.2 -d '{"Repositories": { "base_url": "http://node1/hdp/HDP-2.2", "verify_base_url" : true } }'

curl --user admin:admin -H 'X-Requested-By:HortonworksUniversity' -X PUT http://node1:8080/api/v1/stacks/HDP/versions/2.2/operating_systems/redhat6/repositories/HDP-UTILS-1.1.0.20 -d '{"Repositories": { "base_url": "http://node1/hdp/HDP-UTILS-1.1.0.20", "verify_base_url" : true } }'

curl --user admin:admin -H 'X-Requested-By:HortonworksUniversity' -X POST http://node1:8080/api/v1/blueprints/horton -d @./ops.blueprint

curl --user admin:admin -H 'X-Requested-By:HortonworksUniversity' -X POST http://node1:8080/api/v1/clusters/horton -d @./ops.hostmapping
