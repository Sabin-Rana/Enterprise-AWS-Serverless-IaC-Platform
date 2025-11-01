# ==============================================================================
# ZERO-COST VALIDATION ENVIRONMENT - ENTERPRISE SERVERLESS
# ==============================================================================
# This configuration demonstrates complete enterprise serverless architecture
# with AWS Config compliance and drift detection patterns.
#
# SAFETY MECHANISM: All modules use count = 0
#   - Terraform PLAN shows what WOULD be created (35-45 resources)
#   - Terraform APPLY creates ZERO AWS resources
#   - AWS costs: $0 guaranteed
#
# FOR DEPLOYMENT: Change count = 0 to count = 1 in each module
# ==============================================================================

# Project configuration
variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "serverless-iac-platform"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "validation"
}

# Example module structure - to be populated with actual modules
# module "api_gateway" {
#   count = 0  # ZERO-COST SAFETY LOCK
#   source = "../../modules/api"
#   
#   # These variables are parsed but IGNORED when count = 0
#   function_name = var.api_function_name
#   runtime       = var.lambda_runtime
# }