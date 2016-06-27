FROM alpine:3.4

MAINTAINER AlexLee <alexlee7171@gmail.com>

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk upgrade --update && \
	apk add --update curl wget ca-certificates && \
    rm -rf /var/cache/apk/*

# Install Kibana 4.5.1
# Kibana installation
RUN wget https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz && \
	tar xf kibana-4.5.1-linux-x64.tar.gz && \
	rm kibana-4.5.1-linux-x64.tar.gz && \
	mv kibana-4.5.1-linux-x64 kibana

# Define default command.
CMD ["/kibana/bin/kibana"]

EXPOSE 5601