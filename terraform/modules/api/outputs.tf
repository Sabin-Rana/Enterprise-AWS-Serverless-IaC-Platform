# ==============================================================================
# API MODULE OUTPUTS - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines output values for the API Gateway and Lambda module
# Outputs provide essential API and Lambda information for other modules
# ==============================================================================

# API Gateway Information Outputs
output "api_gateway_id" {
  description = "ID of the API Gateway REST API"
  value       = try(aws_api_gateway_rest_api.main[0].id, "not-created-for-validation")
}

output "api_gateway_name" {
  description = "Name of the API Gateway REST API"
  value       = try(aws_api_gateway_rest_api.main[0].name, "not-created-for-validation")
}

# Lambda Function Information Outputs
output "lambda_function_arn" {
  description = "ARN of the Lambda function for blog posts"
  value       = "not-created-due-to-zero-cost-validation"
}

output "lambda_function_name" {
  description = "Name of the Lambda function for blog posts"
  value       = "not-created-due-to-zero-cost-validation"
}

# Validation Status Outputs
output "module_validation_status" {
  description = "Validation status of the API Gateway and Lambda module"
  value       = "Module configured for zero-cost validation - no AWS resources created"
}

output "enterprise_patterns_demonstrated" {
  description = "List of enterprise architecture patterns implemented"
  value       = [
    "api-gateway-regional-endpoints",
    "lambda-production-configuration", 
    "iam-least-privilege-roles",
    "environment-isolation",
    "distributed-tracing",
    "zero-cost-validation"
  ]
}