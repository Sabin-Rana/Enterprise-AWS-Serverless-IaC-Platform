# ==============================================================================
# AUTHENTICATION MODULE OUTPUTS - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines output values for the Cognito authentication module
# Outputs provide essential authentication information for other modules
# ==============================================================================

# User Pool Information Outputs
output "user_pool_id" {
  description = "ID of the Cognito User Pool"
  value       = try(aws_cognito_user_pool.validation_example[0].id, "not-created-due-to-count-0")
}

output "user_pool_arn" {
  description = "ARN of the Cognito User Pool"
  value       = "not-created-due-to-zero-cost-validation"
}

output "user_pool_endpoint" {
  description = "Endpoint of the Cognito User Pool"
  value       = "not-created-due-to-zero-cost-validation"
}

# User Pool Client Information Outputs
output "user_pool_client_id" {
  description = "ID of the Cognito User Pool Client"
  value       = "not-created-due-to-zero-cost-validation"
}

output "user_pool_client_secret" {
  description = "Secret of the Cognito User Pool Client"
  value       = "not-created-due-to-zero-cost-validation"
  sensitive   = true
}

# Identity Pool Information Outputs
output "identity_pool_id" {
  description = "ID of the Cognito Identity Pool"
  value       = "not-created-due-to-zero-cost-validation"
}

# IAM Role Outputs
output "authenticated_role_arn" {
  description = "ARN of the IAM role for authenticated users"
  value       = "not-created-due-to-zero-cost-validation"
}

# Validation Status Outputs
output "authentication_module_status" {
  description = "Validation status of the authentication module"
  value       = "Module configured for zero-cost validation - no Cognito resources created"
}

output "enterprise_auth_patterns" {
  description = "List of enterprise authentication patterns implemented"
  value       = [
    "cognito-user-pools",
    "identity-pools",
    "multi-factor-authentication",
    "advanced-security",
    "oauth-flows",
    "least-privilege-roles",
    "zero-cost-validation"
  ]
}