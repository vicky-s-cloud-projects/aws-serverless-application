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

## Application Screenshots 

### Signup Page
<img width="1909" height="1044" alt="Screenshot (41)" src="https://github.com/user-attachments/assets/66cc6560-9587-45b6-9f90-4b94d1b51ba4" />

### Login Page
<img width="1906" height="993" alt="Screenshot (42)" src="https://github.com/user-attachments/assets/7e2eccf5-c697-4635-b1fd-59eb696064a1" />

### Dashboard
<img width="1917" height="966" alt="Screenshot (43)" src="https://github.com/user-attachments/assets/59b51131-9adc-41ff-ac4a-383b924cc13f" />

### Create Event
<img width="1913" height="976" alt="Screenshot (44)" src="https://github.com/user-attachments/assets/4089d320-1278-4eed-91d3-96b29730c2f2" />

### Events Listing
<img width="1920" height="971" alt="Screenshot (45)" src="https://github.com/user-attachments/assets/f1c4aa71-961f-4922-bb40-2f236ec609fa" />

### CI/CD Pipeline with Github Actions
<img width="1920" height="983" alt="Screenshot (46)" src="https://github.com/user-attachments/assets/493bdb58-cb03-4f43-a025-2a87631bafe4" />

### AWS Lambda Funtions
<img width="1920" height="972" alt="Screenshot (47)" src="https://github.com/user-attachments/assets/987182cd-2cd7-4643-b5d5-1b34bfb6619c" />

### AWS CloudFront Distributions
<img width="1920" height="924" alt="Screenshot (48)" src="https://github.com/user-attachments/assets/542d32f9-684b-4009-b360-e6b73b7b941f" />

### AWS CloudFront Origin Access Control
<img width="1920" height="969" alt="Screenshot (49)" src="https://github.com/user-attachments/assets/97cc8c47-59a4-4342-bd43-7939e64cc8cb" />

### AWS IAM Roles
<img width="1920" height="969" alt="Screenshot (50)" src="https://github.com/user-attachments/assets/7b4f694d-9396-4d2d-aac3-6deec1287780" />

### AWS Amazon s3 Bucket for Static content
<img width="1920" height="979" alt="Screenshot (51)" src="https://github.com/user-attachments/assets/862fd057-6e3c-4d44-97d0-ad858d820884" />

### AWS Amazon s3 Bucket for Terraform State
<img width="1920" height="969" alt="Screenshot (52)" src="https://github.com/user-attachments/assets/a9360166-3def-4b3e-8dff-8e668dc5ba76" />

### AWS API Gateways
<img width="1920" height="968" alt="Screenshot (54)" src="https://github.com/user-attachments/assets/591f1c65-d0d6-4cd6-a6cf-b4c469d00b74" />

### AWS DynamoDB Tables
<img width="1920" height="988" alt="Screenshot (53)" src="https://github.com/user-attachments/assets/c240927a-4ee3-442e-b4d4-663bdeb1d353" />

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





