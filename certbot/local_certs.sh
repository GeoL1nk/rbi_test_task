mkdir -p conf/live/localhost
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048     -keyout conf/live/localhost/privkey.pem     -out conf/live/localhost/fullchain.pem     -subj "/CN=localhost"