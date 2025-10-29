# ==============================================================================
# MONITORING MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the CloudWatch monitoring module
# Variables control alarm thresholds, dashboard configuration, and logging settings
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
  description = "Common tags applied to all monitoring resources"
  type        = map(string)
  default     = {}
}

# Region Configuration
variable "region" {
  description = "AWS region for monitoring resources"
  type        = string
  default     = "us-east-1"
}

# CloudWatch Alarm Configuration
variable "lambda_error_threshold" {
  description = "Error count threshold for Lambda alarm"
  type        = number
  default     = 5
}

variable "api_gateway_error_threshold" {
  description = "5XX error threshold for API Gateway alarm"
  type        = number
  default     = 10
}

variable "lambda_duration_threshold" {
  description = "Duration threshold for Lambda performance alarm (ms)"
  type        = number
  default     = 5000
}

# CloudWatch Logs Configuration
variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 30
}

# X-Ray Tracing Configuration
variable "xray_sampling_rate" {
  description = "Sampling rate for X-Ray tracing (0.0 to 1.0)"
  type        = number
  default     = 0.05
}

# SNS Topic Configuration
variable "alarm_notification_arn" {
  description = "ARN of SNS topic for alarm notifications"
  type        = string
  default     = ""
}

# Dashboard Configuration
variable "enable_detailed_monitoring" {
  description = "Enable detailed monitoring with additional metrics"
  type        = bool
  default     = true
}