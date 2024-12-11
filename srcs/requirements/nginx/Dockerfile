# Pull the minimal debian image from version 11.11 Bullseye
FROM debian:bullseye

# install nginx
RUN apt-get update \
	&& apt-get install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring \
	&& curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null \
	&& gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg \
	&& echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list \
	&& apt-get update \
	&& apt-get install -y nginx

# install SSL
RUN apt-get install -y openssl \
	&& mkdir /etc/nginx/ssl \
	&& mkdir /etc/nginx/ssl/certs \
	&& mkdir /etc/nginx/ssl/private

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/certs/nginx.crt \
	-keyout /etc/nginx/ssl/private/nginx.key \
	-subj "/C=FR/ST=Paris/L=Paris/0=42 School/0U=llarue/CN=llarue.42.fr"

# Copy our nginx configuration file to run
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# Open the port used to access
EXPOSE 443

# Run the nginx on server
CMD ["nginx", "-g", "daemon off;"]
