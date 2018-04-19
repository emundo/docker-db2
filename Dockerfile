FROM ibmcom/db2express-c:latest

ENV DB2INST1_PASSWORD=dockertester
ENV LICENSE=accept

#Copy sample script 
COPY . /

# Install DB2 Express-C. By calling entrypoint.sh without "db2start" (here "true"), the db2 instance will not start 
RUN /entrypoint.sh "true"

# Setup sample database
RUN /init_db2_tables.sh

# Start database instance as foreground process
ENTRYPOINT ["/entrypoint.sh", "db2start"]

EXPOSE 50000
