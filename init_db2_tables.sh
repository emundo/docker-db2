#!/bin/bash
set -e

su - db2inst1 << EOF
whoami
db2start

db2set DB2COMM=tcpip

db2 create database rcitest

db2 connect to rcitest USER db2inst1 USING ${DB2INST1_PASSWORD}

db2 -tvf /db2.ddl
db2 terminate
db2stop
EOF
whoami
