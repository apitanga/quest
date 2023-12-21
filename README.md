# Cloud Quest Project [![CI/CD to Cloud Run](https://github.com/apitanga/quest/actions/workflows/main.yml/badge.svg)](https://github.com/apitanga/quest/actions/workflows/main.yml)

## Overview
Welcome to the Cloud Quest Project. This isn't just another deployment task; it's an exploration into the efficient and smart world of cloud engineering. Here, I tackled the challenge of deploying a Node.js app in the Google Cloud environment, making full use of CI/CD pipelines, IaC, containerization, and cloud-native practices.

## Key Technologies
- **Cloud Platform**: Google Cloud Run (GCP)
- **Container Tech**: Docker
- **Automated Pipelines**: GitHub Actions
- **IaC**: Terraform, and Terraform Cloud
- **Reverse Proxy**: Nginx
- **Process Supervision**: Supervisord
- **Source Control**: Git

## Architecture
In this project, GitHub Actions are the backbone of our CI/CD strategy, orchestrating the build and deployment. Docker wraps our application as a neat immutable, deployable artifact, while Terraform scripts lay down the infrastructure on Google Cloud Run. Nginx plays its part as a reverse proxy, and Supervisord keeps our containerized processes in line.

## Setting Things Up
Our integration and deployment routine is fully automated via GitHub Actions. It covers everything from Docker builds to pushing images to the container registry, with Terraform handling the cloud infrastructure deployment.  You shuold be able to clone this repo, add your auth secrets and everything should Just Work.

### Essential GitHub Secrets
- **Google Cloud Auth (`GCP_SA_KEY`)**: Our key to the Google Cloud kingdom.
- **Terraform Cloud Auth (`TF_API_TOKEN`)**: The secret sauce for Terraform Cloud interactions, managing our state file like a pro.

## Testing Your Deployment
Check out the application on the Cloud Run URL and give those service endpoints a run for their money.

### Project Endpoint
Sent via email.

## Challenges and solutions

### Port mismatch: Cloud Run requires apps to serve traffic on port '8080 or bust', but the app code (which I couldn't modify) expected traffic to be served on port 3000. I used Nginx to bridge the port gap seamlessly.

### TLS: The Easy Way
Thanks to Cloud Run, we handled SSL/TLS like it's no big deal.

### Supervisord: Process watchdog
Managing Docker processes like a boss.

### Directory Structure adjustment
App expected the binary file in a relative path (bin/) while repo presented both dirs at same hierachy level. A bit of Dockerfile magic ensured our app found its binaries right where it expected them.

### Load Balancing, simplified
Started with Cloud Run's own load balancing. I've set the number of replicas to 1 (to reduce costs) but could scale out as needed behind the same service endpoint. Neat, but we've got grander plans.

### Strategic Choices

#### Terraform Cloud
For state file security and team-friendly management.

#### CI/CD first design
I chose to build the solution CI/CD first, to faciliate future (hypothetical) development and to demonstrate best practices.

### TODO

### Implement path filters
Enable github action path filters to prevent build being triggered on trivial changes (e.g readme updates)

#### Custom Domain
A custom domain SSL to put a personal stamp on the endpoint.

#### Logging and Monitoring/Alerting
A real production environment would need robust logging, service health monitoring, and ops notifications.

### Container Security Scanning
Implement container scanning before deployment, prevent critical vulnerabilities from reaching production (i.e. public facing vulns).

#### Base64 encoding for secrets
Enable base64 encoding/decoding of secrets for a small but relevant extra bit of security.

#### Google Cloud Load Balancer
Future plans could use more sophisticated LBs, but Cloud Run can inherently scale out the app and serve traffic to the service endpoint seamlessly and simply.

## Wrapping Up
This project is more than just lines of code and cloud resources. It's about smart solutions, efficient automation, and the thrill of cloud engineering. 

Got questions or want to talk shop? I'm all ears.
