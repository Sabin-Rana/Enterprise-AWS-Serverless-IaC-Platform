# ==============================================================================
# DRIFT DETECTION MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the drift detection module
# Variables control detection thresholds, notification settings, and monitoring configurations
# ==============================================================================

# Project Configuration
variable "project_name" {
  description = "Project name for resource naming and tagging"
  type        = string
}

variable "environment" {
  description = "Environment for resource naming and tagging"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all drift detection resources"
  type        = map(string)
  default     = {}
}

# Drift Detection Configuration
variable "drift_threshold" {
  description = "Threshold for considering resource changes as drift (percentage)"
  type        = number
  default     = 10

  validation {
    condition     = var.drift_threshold >= 0 && var.drift_threshold <= 100
    error_message = "Drift threshold must be between 0 and 100 percent."
  }
}

variable "drift_frequency_threshold" {
  description = "Threshold for high drift detection frequency alerts"
  type        = number
  default     = 10
}

variable "enable_real_time_detection" {
  description = "Enable real-time drift detection via CloudWatch Events"
  type        = bool
  default     = true
}

variable "enable_scheduled_detection" {
  description = "Enable scheduled drift detection runs"
  type        = bool
  default     = true
}

# Resource Monitoring Configuration
variable "monitor_lambda_functions" {
  description = "Monitor Lambda functions for configuration drift"
  type        = bool
  default     = true
}

variable "monitor_api_gateway" {
  description = "Monitor API Gateway resources for configuration drift"
  type        = bool
  default     = true
}

variable "monitor_dynamodb_tables" {
  description = "Monitor DynamoDB tables for configuration drift"
  type        = bool
  default     = true
}

variable "monitor_cognito_pools" {
  description = "Monitor Cognito User Pools for configuration drift"
  type        = bool
  default     = true
}

# Notification Configuration
variable "drift_notification_emails" {
  description = "List of email addresses for drift notifications"
  type        = list(string)
  default     = []
}

variable "enable_sms_notifications" {
  description = "Enable SMS notifications for critical drift alerts"
  type        = bool
  default     = false
}

variable "critical_drift_phone_numbers" {
  description = "List of phone numbers for critical drift SMS alerts"
  type        = list(string)
  default     = []
}

# Infrastructure Configuration
variable "terraform_state_bucket" {
  description = "S3 bucket containing Terraform state for comparison"
  type        = string
  default     = ""
}

variable "terraform_state_region" {
  description = "AWS region for Terraform state bucket"
  type        = string
  default     = "us-east-1"
}

# Lambda Configuration
variable "drift_detection_timeout" {
  description = "Timeout for drift detection Lambda function in seconds"
  type        = number
  default     = 300
}

variable "drift_detection_memory" {
  description = "Memory allocation for drift detection Lambda function in MB"
  type        = number
  default     = 128
}

# Alert Severity Configuration
variable "critical_drift_actions" {
  description = "List of resource actions considered critical for drift"
  type        = list(string)
  default     = ["DeleteFunction", "DeleteTable", "DeleteRestApi", "DeleteUserPool"]
}

variable "warning_drift_actions" {
  description = "List of resource actions considered warnings for drift"
  type        = list(string)
  default     = ["UpdateFunctionConfiguration", "UpdateTable", "UpdateRestApi"]
}