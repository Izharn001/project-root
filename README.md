# 📦 Node DevOps Project (Docker + CI/CD + Terraform + AWS)

## 📌 Overview
This project demonstrates an end-to-end DevOps workflow by deploying a containerised Node.js application to AWS using Infrastructure as Code and CI/CD automation.

The application is built with Node.js, containerised using Docker, automatically built and pushed via GitHub Actions, and deployed to an AWS EC2 instance provisioned using Terraform.

---

## 🧰 Tech Stack

- **Application:** Node.js (Express)
- **Containerisation:** Docker
- **CI/CD:** GitHub Actions
- **Cloud Provider:** AWS (EC2)
- **Infrastructure as Code:** Terraform

---

## ⚙️ Architecture

**Flow:**

1. Code is pushed to GitHub  
2. GitHub Actions builds Docker image  
3. Image is pushed to Docker Hub  
4. Terraform provisions AWS infrastructure  
5. EC2 instance installs Docker and runs the container via user data  

---

## 🚀 Deployment Process

### 1. Build & Push (CI/CD)

- GitHub Actions triggers on push to `main`
- Docker image is built from `/app`
- Image is tagged:
  - `latest`
  - commit SHA
- Image is pushed to Docker Hub

---

### 2. Infrastructure Provisioning (Terraform)

Terraform creates:
- EC2 instance (Amazon Linux 2023)
- Security group (ports 22, 3000 open)

---

### 3. Application Deployment

EC2 uses a `user_data` script to:
- install Docker
- pull the image from Docker Hub
- run the container automatically

---

## 🌐 Accessing the Application

After deployment:

```
http://35.176.29.248:3000
```

Health check endpoint:

```
/health
```

---

## 📁 Project Structure

```
project-root/
├── app/
│   ├── app.js
│   ├── package.json
│   ├── Dockerfile
│   └── .dockerignore
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   └── user_data.sh
└── .github/
    └── workflows/
        └── ci.yml
```

---

## 🔐 Environment Variables

- Managed locally using `.env`
- Injected into the container at runtime
- Not committed to GitHub

---

## ⚠️ Notes & Improvements

- Currently uses `latest` tag (can be improved using commit SHA for stable deployments)
- No load balancer or domain configured yet
- No HTTPS (future improvement)
- No container orchestration (ECS/Kubernetes planned)

---

## 🔄 Future Enhancements

- Use AWS ECR instead of Docker Hub
- Deploy via ECS or Kubernetes
- Implement GitOps with Argo CD
- Add domain and HTTPS (Route53 + Nginx)
- Use Terraform remote state (S3 + DynamoDB)

---

## 💡 Key Learnings

- Built and containerised a Node.js application
- Implemented CI/CD pipeline using GitHub Actions
- Provisioned AWS infrastructure using Terraform
- Automated deployment using EC2 user data
- Understood full DevOps lifecycle from code to production

---

## 📬 Author

Built by Izharn Mohammed

---

