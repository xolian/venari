#!/bin/sh

set -ex
docker run -it --name venari-bootstrap --rm -v "${PWD}:/host" -v /var/run/docker.sock:/var/run/docker.sock assertsecurity/venari-bootstrap:2.0 secrets -gencerts
