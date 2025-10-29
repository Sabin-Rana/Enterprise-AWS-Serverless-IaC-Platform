# ==============================================================================
# MONITORING MODULE - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This module creates CloudWatch monitoring with enterprise patterns including:
# - CloudWatch Dashboards for centralized observability
# - CloudWatch Alarms for proactive alerting
# - CloudWatch Log Groups for application logging
# - X-Ray tracing for distributed system monitoring
# ==============================================================================

# ==============================================================================
# CLOUDWATCH DASHBOARD - CENTRALIZED OBSERVABILITY
# ==============================================================================

resource "aws_cloudwatch_dashboard" "main" {
  # ============================================================================
  # DEPLOYMENT CONTROL - ZERO-COST VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Shows in terraform plan as "will not be created"
  #   - Demonstrates dashboard configuration and widget layout
  #   - Maintains absolute zero-cost guarantee
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual CloudWatch Dashboard in AWS
  #   - Provides centralized view of all application metrics
  #   - No additional cost for CloudWatch Dashboards
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  dashboard_name = "${var.project_name}-${var.environment}"
  
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/Lambda", "Invocations", "FunctionName", "${var.project_name}-get-posts-${var.environment}"],
            [".", "Errors", ".", "."],
            [".", "Duration", ".", "."]
          ]
          view    = "timeSeries"
          stacked = false
          region  = var.region
          title   = "Lambda Performance"
        }
      },
      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/ApiGateway", "Count", "ApiName", "${var.project_name}-${var.environment}"],
            [".", "5XXError", ".", "."],
            [".", "Latency", ".", "."]
          ]
          view    = "timeSeries"
          stacked = false
          region  = var.region
          title   = "API Gateway Metrics"
        }
      }
    ]
  })

  tags = merge(var.tags, {
    Name      = "${var.project_name}-dashboard"
    Component = "cloudwatch-dashboard"
  })
}

# ==============================================================================
# CLOUDWATCH ALARM - LAMBDA ERROR MONITORING
# ==============================================================================

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  # ============================================================================
  # DEPLOYMENT CONTROL - ALERTING VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Demonstrates alarm configuration in terraform plan
  #   - Shows error threshold and notification setup
  #   - No CloudWatch alarm costs when not deployed
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual CloudWatch Alarm for Lambda errors
  #   - Enables proactive alerting for application issues
  #   - No cost for basic CloudWatch Alarms
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  alarm_name          = "${var.project_name}-lambda-errors-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = "300"
  statistic           = "Sum"
  threshold           = "5"
  alarm_description   = "This alarm triggers when Lambda errors exceed threshold"
  alarm_actions       = ["placeholder-sns-topic-arn"]  # Would reference actual SNS topic

  dimensions = {
    FunctionName = "${var.project_name}-get-posts-${var.environment}"
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-lambda-errors-alarm"
    Component = "cloudwatch-alarm"
  })
}

# ==============================================================================
# CLOUDWATCH LOG GROUP - APPLICATION LOGGING
# ==============================================================================

resource "aws_cloudwatch_log_group" "api_gateway" {
  # ============================================================================
  # DEPLOYMENT CONTROL - LOGGING VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Shows log group configuration in terraform plan
  #   - Demonstrates retention policy and log management
  #   - No CloudWatch Logs ingestion costs when not deployed
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates CloudWatch Log Group for API Gateway logs
  #   - Enables centralized logging and troubleshooting
  #   - Incurs CloudWatch Logs ingestion and storage costs
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  name              = "/aws/apigateway/${var.project_name}-${var.environment}"
  retention_in_days = 30

  tags = merge(var.tags, {
    Name      = "${var.project_name}-api-gateway-logs"
    Component = "cloudwatch-logs"
  })
}

# ==============================================================================
# X-RAY TRACING CONFIGURATION - DISTRIBUTED TRACING
# ==============================================================================

resource "aws_xray_sampling_rule" "api_tracing" {
  # ============================================================================
  # DEPLOYMENT CONTROL - TRACING VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Demonstrates X-Ray configuration in terraform plan
  #   - Shows sampling rules and trace collection strategy
  #   - No X-Ray costs when not deployed
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates X-Ray sampling rule for API tracing
  #   - Enables distributed transaction monitoring
  #   - Incurs X-Ray trace analysis and storage costs
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  rule_name      = "${var.project_name}-api-tracing-${var.environment}"
  priority       = 9000
  version        = 1
  reservoir_size = 1
  fixed_rate     = 0.05
  url_path       = "*"
  host           = "*"
  http_method    = "*"
  service_type   = "*"
  service_name   = "*"
  resource_arn   = "*"

  tags = merge(var.tags, {
    Name      = "${var.project_name}-xray-sampling"
    Component = "xray-tracing"
  })
}