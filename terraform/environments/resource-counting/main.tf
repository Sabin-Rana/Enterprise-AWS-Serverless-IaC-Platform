# ==============================================================================
# RESOURCE COUNTING CONFIGURATION - ENTERPRISE SERVERLESS ARCHITECTURE  
# ==============================================================================
# This configuration enables resource count validation for enterprise serverless
# architecture with AWS Config compliance and drift detection patterns.
# ==============================================================================

# AWS Provider Configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.19"  # Changed from ~> 5.0 to ~> 6.19
    }
  }
}

provider "aws" {
  region = "us-east-1"
  
  # Safety: Prevent any actual resource creation
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
}

module "api_gateway" {
  source = "../../modules/api"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}

module "database" {
  source = "../../modules/database"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}

module "authentication" {
  source = "../../modules/auth"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}

module "storage" {
  source = "../../modules/storage"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}

module "monitoring" {
  source = "../../modules/monitoring"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}

module "compliance" {
  source = "../../modules/compliance"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}

module "drift_detection" {
  source = "../../modules/drift-detection"
  
  project_name = "enterprise-serverless-platform"
  environment  = "validation"
}