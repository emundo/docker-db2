#!/bin/bash
set -e

su - db2inst1 << EOF
whoami
db2start

db2 create database rcitest

db2 connect to rcitest USER db2inst1 USING dockertester

db2 -tvf /db2.ddl
db2 terminate
db2stop
EOF
whoami