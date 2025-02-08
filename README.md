
# RBI Test Task
 This repository contains a project structured with Docker Compose, designed to deploy a web application with Nginx as a reverse proxy and Certbot for SSL certificate management.
 # Deployment diagram
![Deployment diagram](/Architecture_diagram_rbi.png)

  ## How to deploy

To summarize, please ensure that the `hosts.ini` file is properly configured and that the Ansible and target hosts have the following packages installed: 

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common git rsync
```

Additionally, Docker must be installed on the target host. You have the option to complete this setup yourself or set the `$FIRST_TIME_SETUP` variable to true for automatic configuration. 

After the initial setup, you may configure your firewall to block all egress traffic except for SSH from the Ansible host and change `$FIRST_TIME_SETUP` to false. 

If you do not provide a `$DOMAIN_NAME`, the application will deploy using self-signed certificates, allowing for local testing. This process will initiate the `nginx_proxy` and  `tweet_app` containers, with all HTTP requests (port 80) redirected to HTTPS (port 443) by proxy.

To deploy, execute the following Ansible command:

```bash
ansible-playbook -i hosts.ini deploy.yml -e 'ansible_become_pass=$ANSIBLE_BECOME_PASSWORD domain_name=$DOMAIN_NAME first_time_setup=$FIRST_TIME_SETUP'
```

For the deployment to utilize valid certificates, please ensure to provide the `$DOMAIN_NAME` when running the command. This will spin up additional `certbot` container that will issue certificates for this domain

Furthermore, you can configure GitHub Actions on your repository fork to automate the deployment upon commits to the master branch or through manual triggers. To set this up, please configure the following repository secrets: `ANSIBLE_BECOME_PASSWORD`, `SSH_HOST` (the host where Ansible is running), `SSH_PRIVATE_KEY`, `DEPLOY_HOST` (the host where the application will be deployed), and `SSH_USER`.

