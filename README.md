# Cloud Quest Project

## Overview
Welcome to the Cloud Quest Project. This isn't just another deployment task; it's an exploration into the efficient and smart world of cloud engineering. Here, we've tackled the challenge of deploying a Node.js and Golang application in the Google Cloud environment, making full use of CI/CD pipelines, containerization, and cloud-native practices.

## Key Technologies
- **Cloud Platform**: Google Cloud Run (GCP)
- **Container Tech**: Docker
- **Automated Pipelines**: GitHub Actions
- **IaC**: Terraform
- **Web Serving**: Nginx
- **Process Supervision**: Supervisord
- **Source Control**: Git

## Architecture
In this project, GitHub Actions are the backbone of our CI/CD strategy, orchestrating the dance of build and deployment. Docker wraps our application in a neat container package, while Terraform scripts lay down the infrastructure tracks on Google Cloud Run. Nginx plays its part as a reverse proxy, and Supervisord keeps our processes in line.

## Setting Things Up
Our deployment routine is a well-oiled machine, automated via GitHub Actions. It covers everything from Docker builds to pushing images to the container registry, with Terraform handling the cloud infrastructure deployment.

### Essential GitHub Secrets
- **Google Cloud Auth (`GCP_SA_KEY`)**: Our key to the Google Cloud kingdom.
- **Terraform Cloud Auth (`TF_API_TOKEN`)**: The secret sauce for Terraform Cloud interactions, managing our state file like a pro.

## Testing Your Deployment
Check out the application on the Cloud Run URL and give those service endpoints a run for their money.

### Project Endpoint
Catch the live action here: [https://my-service-65rjmtutpq-uc.a.run.app](https://my-service-65rjmtutpq-uc.a.run.app)

## Overcoming Challenges

### The Nginx Solution
When Cloud Run said '8080 or bust', we brought in Nginx to bridge the port gap seamlessly.

### Supervisord: The Overseer
Managing Docker processes like a boss.

### TLS: The Easy Way
Thanks to Cloud Run, we handled SSL/TLS like it's no big deal.

### Directory Structure Puzzle
A bit of Dockerfile magic ensured our app found its binaries right where it expected them.

### Load Balancing, Cloud-Style
Started with Cloud Run's own load balancing. Neat, but we've got grander plans.

### Strategic Moves

#### Terraform Cloud
For state file security and team-friendly management.

### What's Next on the Horizon

### Implement path filters
Enable github action path filters to prevent build being triggered on trivial changes (e.g readme updates)

#### SSL with a Personal Touch
A custom domain SSL to put our stamp on the web.

#### Logging and Monitoring: The Upgrade
Because knowing is half the battle.

#### Secret-Keeping: Base64 Style
Elevating our secret management game with base64 encoding and decoding.

#### Google Cloud Load Balancer
Taking load balancing from neat to elite.

#### CI/CD Tuning
Fine-tuning our pipeline to build smarter, not harder - skipping those README updates.

## Wrapping Up
This project is more than just lines of code and cloud resources. It's about smart solutions, efficient automation, and the thrill of cloud engineering. 

Got questions or want to talk shop? I'm all ears.
