# ==============================================================================
# RESOURCE COUNTING CONFIGURATION - ENTERPRISE SERVERLESS ARCHITECTURE  
# ==============================================================================
# This configuration enables resource count validation for enterprise serverless
# architecture with AWS Config compliance and drift detection patterns.
# ==============================================================================

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
