# Serverless Event Booking Platform on AWS  
### Built with Terraform + GitHub Actions + React + Lambda

This project is a **production-style serverless web application** deployed entirely on AWS using Infrastructure as Code and automated CI/CD.

It demonstrates how to design, provision, deploy, and operate a full-stack cloud-native system using modern DevOps practices.

The application allows users to:

- Sign up and log in
- Create events
- View all events
- Manage their dashboard

Everything is deployed automatically through GitHub Actions.

---

## High-Level Architecture

User Browser
|
CloudFront (CDN)
|
S3 Static Website (React Build)
|
API Gateway (HTTP API)
|
Lambda Functions (Signup / Login / Events / Create Event)
|
DynamoDB (users + events tables) 


---

## AWS Services Used

- Amazon S3 – Frontend hosting  
- Amazon CloudFront – CDN + HTTPS  
- AWS Lambda – Serverless backend  
- API Gateway – REST endpoints  
- DynamoDB – NoSQL database  
- IAM – Security and permissions  
- Terraform – Infrastructure as Code  
- GitHub Actions – CI/CD automation  

---

## Why Serverless?

Serverless was chosen because:

### No server management
No EC2 instances, no patching, no scaling concerns.

### Automatic scaling
Lambda scales automatically based on demand.

### Pay-per-use model
Only pay when functions are invoked.

### Highly available by default
AWS manages availability zones and redundancy.

### Faster development
Focus stays on application logic instead of infrastructure.

This architecture mirrors what many modern startups and SaaS platforms use for MVPs and lightweight production systems.

---

## Why an Event Booking Application?

An event booking platform represents a **real-world business workflow**:

- User authentication
- CRUD operations
- Data persistence
- Frontend + backend interaction

It allows demonstration of:

- Auth flows
- API design
- Database integration
- Frontend consumption of APIs
- End-to-end CI/CD

This makes it far more realistic than a simple “hello world” project.

---

## Why AWS Free Tier Resources?

This project intentionally uses **AWS Free Tier–compatible services**:

- Lambda
- DynamoDB (on-demand)
- S3
- API Gateway
- CloudFront

Reasons:

### Cost efficiency
Demonstrates how to build real systems with minimal spend.

### Practical for learning
Shows how startups prototype without large cloud budgets.

### Recruiter friendly
Anyone can clone and reproduce this setup.

Paid services (RDS, EKS, ALB) were avoided to keep the project accessible.

---

## CI/CD Pipeline (GitHub Actions)

On every push to `main`:

1. Lambda functions are packaged
2. Terraform initializes remote S3 backend
3. Infrastructure is provisioned or updated
4. React frontend is built
5. Build artifacts are uploaded to S3
6. CloudFront cache is invalidated

No manual deployments are required.

This simulates a real DevOps production workflow.

---

## Infrastructure as Code (Terraform)

All AWS resources are defined declaratively:

- IAM roles
- Lambda functions
- API Gateway routes
- DynamoDB tables
- S3 bucket
- CloudFront distribution
- Origin Access Control
- Terraform remote state (S3 backend)

Benefits:

- Reproducible deployments
- Version-controlled infrastructure
- Disaster recovery
- Consistency across environments

---

## Repository Structure

├── frontend/
│ └── frontend/ # React app
├── backend_lambda/
│ ├── signup/
│ ├── login/
│ ├── get_events/
│ └── create_event/
├── terraform/
│ ├── provider.tf
│ ├── iam.tf 
│ ├── lambda.tf
│ ├── dynamodb.tf
│ ├── apigateway.tf
│ ├── cloudfront.tf
│ └── outputs.tf
└── .github/workflows/
└── deploy.yml


---

## Security Considerations

- IAM roles scoped for Lambda
- Origin Access Control prevents direct S3 access
- CloudFront serves frontend securely
- Secrets stored in GitHub Actions Secrets
- CORS configured for browser access

---

## What This Project Demonstrates

- Serverless architecture design
- Terraform remote state management
- CI/CD pipelines
- CloudFront + S3 hosting
- Lambda + API Gateway backend
- DynamoDB integration
- Real-world debugging (CORS, IAM, Terraform drift, CI failures)

---

## Future Improvements

- JWT authentication
- API authorization with Lambda Authorizers
- Input validation layers
- CloudWatch monitoring & alarms
- Terraform modules
- OIDC authentication for GitHub Actions
- Separate environments (dev/stage/prod)
- WAF integration
- Structured logging

---

## Key Learnings

- Terraform state management is critical in CI
- IAM permissions often cause deployment failures
- CORS must be handled explicitly in serverless APIs
- Frontend environment variables must be injected during build
- Cloud-native systems require automation to remain maintainable

---

## Author

Vivek Challa 
Cloud / DevOps Engineering Portfolio Project

---





