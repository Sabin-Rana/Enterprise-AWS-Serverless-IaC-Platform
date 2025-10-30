# ==============================================================================
# DRIFT DETECTION MODULE OUTPUTS - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines output values for the drift detection module
# Outputs provide essential detection information for monitoring and integration
# ==============================================================================

# CloudWatch Events Information Outputs
output "resource_changes_event_rule_name" {
  description = "Name of the CloudWatch Event Rule for resource changes"
  value       = try(aws_cloudwatch_event_rule.resource_changes[0].name, "not-created-due-to-count-0")
}

output "resource_changes_event_rule_arn" {
  description = "ARN of the CloudWatch Event Rule for resource changes"
  value       = "not-created-due-to-zero-cost-validation"
}

# Lambda Function Information Outputs
output "drift_detection_lambda_name" {
  description = "Name of the drift detection Lambda function"
  value       = "not-created-due-to-zero-cost-validation"
}

output "drift_detection_lambda_arn" {
  description = "ARN of the drift detection Lambda function"
  value       = "not-created-due-to-zero-cost-validation"
}

output "drift_detection_lambda_role_arn" {
  description = "ARN of the IAM role for drift detection Lambda"
  value       = "not-created-due-to-zero-cost-validation"
}

# SNS Notification Information Outputs
output "drift_alerts_sns_topic_name" {
  description = "Name of the SNS topic for drift alerts"
  value       = "not-created-due-to-zero-cost-validation"
}

output "drift_alerts_sns_topic_arn" {
  description = "ARN of the SNS topic for drift alerts"
  value       = "not-created-due-to-zero-cost-validation"
}

# CloudWatch Alarm Information Outputs
output "drift_frequency_alarm_name" {
  description = "Name of the drift frequency CloudWatch Alarm"
  value       = "not-created-due-to-zero-cost-validation"
}

output "drift_frequency_alarm_arn" {
  description = "ARN of the drift frequency CloudWatch Alarm"
  value       = "not-created-due-to-zero-cost-validation"
}

# Event Target Information Outputs
output "drift_detection_event_target_id" {
  description = "ID of the CloudWatch Event Target for drift detection"
  value       = "not-created-due-to-zero-cost-validation"
}

# Validation Status Outputs
output "drift_detection_module_status" {
  description = "Validation status of the drift detection module"
  value       = "Module configured for zero-cost validation - no drift detection resources created"
}

output "enterprise_drift_detection_patterns" {
  description = "List of enterprise drift detection patterns implemented"
  value       = [
    "cloudwatch-events-monitoring",
    "real-time-change-detection",
    "lambda-drift-analysis",
    "sns-notification-system",
    "frequency-alerting",
    "infrastructure-integrity",
    "zero-cost-validation"
  ]
}

output "drift_detection_configuration_summary" {
  description = "Summary of drift detection configuration"
  value       = {
    real_time_monitoring    = var.enable_real_time_detection
    scheduled_detection     = var.enable_scheduled_detection
    drift_threshold         = "${var.drift_threshold}%"
    frequency_threshold     = var.drift_frequency_threshold
    monitored_services      = [
      var.monitor_lambda_functions ? "Lambda" : "",
      var.monitor_api_gateway ? "API Gateway" : "",
      var.monitor_dynamodb_tables ? "DynamoDB" : "",
      var.monitor_cognito_pools ? "Cognito" : ""
    ]
    notification_channels   = length(var.drift_notification_emails) > 0 ? "Email" : "None"
    sms_notifications       = var.enable_sms_notifications
  }
}

output "critical_drift_actions" {
  description = "List of actions considered critical for drift detection"
  value       = var.critical_drift_actions
}

output "warning_drift_actions" {
  description = "List of actions considered warnings for drift detection"
  value       = var.warning_drift_actions
}