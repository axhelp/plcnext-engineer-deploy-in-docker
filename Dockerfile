FROM alpine:3.12

WORKDIR /opt/plcnext/projects

COPY ./projects/PCWE /opt/deploy/plcnext/projects/PCWE
COPY ./projects/copy.sh /opt/deploy/plcnext/projects/copy.sh
COPY ./projects/restart.sh /opt/deploy/plcnext/projects/restart.sh
COPY ./projects/restore-permissions.sh /opt/deploy/plcnext/projects/restore-permissions.sh

CMD ["sh", "/opt/deploy/plcnext/projects/copy.sh"]
