# aws-resilient-cicd-pipeline

# 🚀 AWS Resilient CI/CD Pipeline with Incident Management (Terraform)

This project demonstrates a **production-grade, event-driven CI/CD pipeline** on AWS with **automated failure handling, retries, rollback, and alerting** using **Terraform for infrastructure as code (IaC)**.

It leverages key AWS services like **CodePipeline, EventBridge, Step Functions, SNS, and SQS** — making it ideal for DevOps portfolios, job interviews, and real-world deployments.

---

## 🧰 Tech Stack

- **AWS CodePipeline** – CI/CD Orchestration
- **AWS CodeBuild** – Build and test source code
- **AWS CodeDeploy** – Deploy app to EC2/Lambda/ECS
- **Amazon EventBridge** – Detect pipeline failures
- **AWS Step Functions** – Orchestrate incident workflows
- **Amazon SNS** – Send notifications to engineers
- **Amazon SQS** – Queue failed deployments for manual follow-up
- **Terraform** – Infrastructure as Code (IaC)

---

## 🧩 Architecture

```text
[GitHub/CodeCommit]
        |
        v
[EventBridge (CodePush Event)] ---> [CodePipeline]
                                           |
                    +----------------------+-----------------+
                    |                      |                 |
              [CodeBuild]             [CodeDeploy]       [Tests]
                    |                      |
     +--------------+-----------+     +----+------------+
     |  Failure Event to EB     |     | Failure Event   |
     v                          v     v
[EventBridge (Failure Rules)]------------------> [Step Functions]
                                                      |
                    +---------------------------------+---------------------------------+
                    |                                 |                                 |
             [Retry Build/Deploy]         [Rollback to Last Known Good]       [Send Alert via SNS]
                                                                                      |
                                                                              [Team Email/Slack/SMS]
                                                                                      |
                                                                                [Push to SQS Queue]
                                                                                      |
                                                                              [Manual Review / Lambda Handler]

## Project Structure

aws-resilient-cicd/
├── README.md
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   ├── backend.tf              # (optional, for remote S3 state)
│   └── modules/
│       ├── codepipeline/
│       ├── codebuild/
│       ├── codedeploy/
│       ├── eventbridge/
│       ├── stepfunctions/
│       ├── sns/
│       └── sqs/
└── src/
    └── app/                    # sample app code to build/deploy
