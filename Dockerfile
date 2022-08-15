FROM ibmcom/ucds

RUN cd /tmp && \
    unzip -j -d . /tmp/ibm-ucd-*.zip */udclient.zip && \
    unzip udclient.zip

FROM java:alpine

COPY --from=0 /tmp/udclient/* /usr/bin/

ENV LINES 25
ENV COLUMNS 80
ENV PACKAGES "bash"

RUN apk add --update $PACKAGES && rm -rf /var/cache/apk/*
