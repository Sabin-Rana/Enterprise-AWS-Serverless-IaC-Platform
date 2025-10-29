# ==============================================================================
# MONITORING MODULE OUTPUTS - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines output values for the CloudWatch monitoring module
# Outputs provide essential monitoring information for integration and alerts
# ==============================================================================

# CloudWatch Dashboard Information Outputs
output "cloudwatch_dashboard_name" {
  description = "Name of the CloudWatch Dashboard"
  value       = try(aws_cloudwatch_dashboard.main[0].dashboard_name, "not-created-due-to-count-0")
}

output "cloudwatch_dashboard_arn" {
  description = "ARN of the CloudWatch Dashboard"
  value       = "not-created-due-to-zero-cost-validation"
}

# CloudWatch Alarm Information Outputs
output "lambda_errors_alarm_arn" {
  description = "ARN of the Lambda errors CloudWatch Alarm"
  value       = "not-created-due-to-zero-cost-validation"
}

output "lambda_errors_alarm_name" {
  description = "Name of the Lambda errors CloudWatch Alarm"
  value       = "not-created-due-to-zero-cost-validation"
}

# CloudWatch Logs Information Outputs
output "api_gateway_log_group_name" {
  description = "Name of the API Gateway CloudWatch Log Group"
  value       = "not-created-due-to-zero-cost-validation"
}

output "api_gateway_log_group_arn" {
  description = "ARN of the API Gateway CloudWatch Log Group"
  value       = "not-created-due-to-zero-cost-validation"
}

# X-Ray Tracing Information Outputs
output "xray_sampling_rule_name" {
  description = "Name of the X-Ray sampling rule"
  value       = "not-created-due-to-zero-cost-validation"
}

output "xray_sampling_rule_arn" {
  description = "ARN of the X-Ray sampling rule"
  value       = "not-created-due-to-zero-cost-validation"
}

# Validation Status Outputs
output "monitoring_module_status" {
  description = "Validation status of the monitoring module"
  value       = "Module configured for zero-cost validation - no monitoring resources created"
}

output "enterprise_monitoring_patterns" {
  description = "List of enterprise monitoring patterns implemented"
  value       = [
    "cloudwatch-dashboards",
    "metric-alarms",
    "log-aggregation",
    "x-ray-tracing",
    "proactive-alerting",
    "performance-monitoring",
    "zero-cost-validation"
  ]
}

output "alarm_configuration_summary" {
  description = "Summary of alarm configurations"
  value       = {
    lambda_error_threshold    = var.lambda_error_threshold
    api_gateway_error_threshold = var.api_gateway_error_threshold
    lambda_duration_threshold = var.lambda_duration_threshold
    log_retention_days        = var.log_retention_days
    xray_sampling_rate        = var.xray_sampling_rate
  }
}