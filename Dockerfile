FROM ibmcom/db2express-c:latest

#ENV DB2INST1_PASSWORD=dockertester
#ENV LICENSE=accept

#Copy sample script 
COPY --chown=db2inst1:db2inst1 . /

# Install DB2 Express-C
RUN /entrypoint.sh "true"

# Setup sample database
RUN /init_db2_tables.sh

# Start database instance
ENTRYPOINT  su - db2inst1 -c "db2start && (while true; do sleep 1000; done)"

EXPOSE 50005
