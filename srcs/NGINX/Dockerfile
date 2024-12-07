FROM ubuntu

RUN apt-get update \
	&& apt install -Y curl gnupg2 ca-certificates lsb-release debian-archive-keyring \
	&& crl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null \
	&& gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg \
	&& echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
		http://nginx.org/packages/debian `lsb_release -cs` nginx" \
		| sudo tee /etc/apt/sources.list.d/nginx.list \
	&& apt-get update \
	&& apt-get install nginx
