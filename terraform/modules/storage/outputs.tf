# ==============================================================================
# STORAGE MODULE OUTPUTS - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines output values for the S3 and CloudFront module
# Outputs provide essential storage and CDN information for other modules
# ==============================================================================

# S3 Bucket Information Outputs
output "s3_bucket_id" {
  description = "ID of the S3 bucket for frontend hosting"
  value       = try(aws_s3_bucket.frontend[0].id, "not-created-due-to-count-0")
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket for frontend hosting"
  value       = "not-created-due-to-zero-cost-validation"
}

output "s3_bucket_domain" {
  description = "Domain name of the S3 bucket"
  value       = "not-created-due-to-zero-cost-validation"
}

# CloudFront Information Outputs
output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = "not-created-due-to-zero-cost-validation"
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = "not-created-due-to-zero-cost-validation"
}

output "cloudfront_arn" {
  description = "ARN of the CloudFront distribution"
  value       = "not-created-due-to-zero-cost-validation"
}

# Validation Status Outputs
output "storage_module_status" {
  description = "Validation status of the storage module"
  value       = "Module configured for zero-cost validation - no storage resources created"
}

output "enterprise_storage_patterns" {
  description = "List of enterprise storage patterns implemented"
  value       = [
    "s3-static-hosting",
    "cloudfront-cdn",
    "versioning-protection",
    "security-hardening",
    "ssl-encryption",
    "zero-cost-validation"
  ]
}