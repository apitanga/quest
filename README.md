##Cloud Quest Project
O#verview
This project is a technical showcase in deploying a web application using cloud engineering principles, automated CI/CD pipelines, and containerization. It focuses on deploying a Node.js and Golang application in a Google Cloud environment, exemplifying an efficient and modern deployment approach.

#Technologies Used
Cloud Platforms: Google Cloud Run (GCP)
Containerization: Docker
CI/CD: GitHub Actions
Infrastructure as Code: Terraform
Web Server: Nginx
Process Management: Supervisord
Version Control: Git

#Architecture
The project employs GitHub Actions for continuous integration and deployment, Docker for containerizing the application, Terraform for infrastructure provisioning, Nginx as a reverse proxy, and Supervisord for managing application processes.

#Setup and Deployment
The deployment process is automated through GitHub Actions, which handles the Docker image build and push to the container registry upon commits to the master branch. Terraform scripts are used for provisioning infrastructure on Google Cloud Run.

Required GitHub Secrets
Google Authentication Secret (GCP_SA_KEY): Used for authenticating with Google Cloud services.
Terraform Cloud Authentication Secret (TF_API_TOKEN): Utilized for authenticating with Terraform Cloud, primarily for managing the state file.
Testing the Setup
Verify the deployment by accessing the Cloud Run-provided application URL and testing the functionality through specified service endpoints.

Challenges and Improvements
Nginx Implementation: Implemented to address port compatibility issues between the application and Google Cloud Run.
Supervisord: Used for effective process management within the Docker container.
TLS Implementation: Simplified by choosing Google Cloud Run, which seamlessly manages SSL certificates.
Application Directory Structure Challenge: Addressed the specific requirement of the application's directory structure, arranging files in the Dockerfile to meet these expectations.
Strategic Decisions
Use of Terraform Cloud: Chosen for managing the Terraform state file, enhancing security and collaboration.
Future Enhancements
Custom Domain and SSL: Plans to introduce a custom domain with SSL for enhanced security and professional web presence.
Advanced Logging and Monitoring: Implementing robust logging and monitoring solutions is on the agenda.
Secure Handling of Secrets: Intends to incorporate base64 encoding and decoding for managing GitHub secrets for increased security.
Conclusion
This project illustrates a comprehensive approach to cloud application deployment, emphasizing automation, scalability, and security. It showcases the effective integration of cloud-native technologies and CI/CD practices.

For any inquiries or discussions, feel free to reach out.
