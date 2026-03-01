# Git Repository for the GCP part of my annual project at ESGI.

## What do I deploy ?

This repository contains all the GCP part of my hybrid infrastructure.
The requirement was to build a monitoring stack involving log ingestion using pub/sub, followed by an analysis in BigQuery. That is it for the observability part.
I also had to deploy a VPN to interconnect my VPC with my on-premise VPC. 
For the Kubernetes part, I deployed a GKE Autopilot cluster to host ArgoCD as my kubernetes cluster manager for on-premise clusters.
Everything is deployed using Infrastructure as Code tools like Terraform to be easily managed and replicated.

## Requirements

We need to activate a few API before being able to deploy all our stack.

Here is the list of APIs:

- Compute Engine API
- Cloud Storage API

## Organization

### Terraform Hierarchy

All the mandatory part of Indio infrastructure are located and configured in the modules directory.
Then every part has its own directory to be apply from. Those directory are located in the main folder.

### State Management

To store tfstate files, I configured a GCS bucket with versionning enabled. It allow me to store my tfstate file remotely. It helps prevent accidental removal or if you work with other developpers, it can prevent from tfstate configuration mismatch and a broken infrastructure. 

### Authentication

I created a Service Account for Terraform. As I run Terraform on my local machine, I exported the path of my json key file to GOOGLE_APPLICATION_CREDENTIALS env variable. Terraform use it by default.

### Access Management

I followed the `Least Privilege` principle for Terraform's service account. It only has the required rights. Here's an overview of what rights he has:
- Network Admin : VPC management, Compute related tasks
- Storage Admin : Bucket related management (e.g. tfstates)

## CI/CD

I use Gitlab deployed on GCP for all the pipeline process. Gitlab CI has to manage builds, tests and integrations.

### Registry

The registry I use for my docker images is Artifact Registry from GCP.

## Deployments

- [Network](./main/network/README.md)
- [Compute](./main/compute/README.md)