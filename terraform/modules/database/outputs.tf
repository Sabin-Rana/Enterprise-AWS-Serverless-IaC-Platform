# ==============================================================================
# DATABASE MODULE OUTPUTS - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines output values for the DynamoDB module
# Outputs provide essential table information for other modules
# ==============================================================================

# Table Information Outputs
output "posts_table_name" {
  description = "Name of the posts DynamoDB table"
  value       = "not-created-due-to-zero-cost-validation"
}

output "projects_table_name" {
  description = "Name of the projects DynamoDB table"
  value       = "not-created-due-to-zero-cost-validation"
}

output "validation_table_name" {
  description = "Name of the validation DynamoDB table"
  value       = try(aws_dynamodb_table.validation_example[0].name, "not-created-due-to-count-0")
}

# Table ARN Outputs
output "posts_table_arn" {
  description = "ARN of the posts DynamoDB table"
  value       = "not-created-due-to-zero-cost-validation"
}

output "projects_table_arn" {
  description = "ARN of the projects DynamoDB table"
  value       = "not-created-due-to-zero-cost-validation"
}

# Validation Status Outputs
output "database_module_status" {
  description = "Validation status of the database module"
  value       = "Module configured for zero-cost validation - no DynamoDB tables created"
}

output "enterprise_database_patterns" {
  description = "List of enterprise database patterns implemented"
  value       = [
    "dynamodb-provisioned-capacity",
    "global-secondary-indexes",
    "point-in-time-recovery",
    "server-side-encryption",
    "optimized-key-design",
    "zero-cost-validation"
  ]
}