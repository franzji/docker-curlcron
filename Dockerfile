FROM ubuntu:latest
MAINTAINER franz.albright@woodwing.com

#Install Cron
RUN apt-get update
RUN apt-get -y install cron

#Install Curl
RUN apt-get -y install curl

# Add crontab file in the cron directory
COPY crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Apply cronjob
RUN crontab /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

