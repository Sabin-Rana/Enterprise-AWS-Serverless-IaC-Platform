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
  description = "ARN