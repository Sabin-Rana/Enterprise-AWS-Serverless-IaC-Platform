=# ==============================================================================
# API GATEWAY & LAMBDA MODULE - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This module creates API Gateway and Lambda functions with enterprise patterns including:
# - API Gateway REST API with regional endpoints
# - Lambda functions with production configuration
# - IAM roles with least privilege principles
# - Integration between API Gateway and Lambda functions
# ==============================================================================

# ==============================================================================
# ENTERPRISE DESIGN PATTERNS
# Commented sections demonstrate production architecture
# Active resources use count = 0 for zero-cost validation
# ==============================================================================

# API Gateway REST API for serverless portfolio
# resource "aws_api_gateway_rest_api" "main" {
#   name        = "${var.project_name}-${var.environment}"
#   description = "Serverless Portfolio API with blog functionality - ${var.environment}"
# 
#   # Enterprise: Regional endpoints for reduced latency
#   endpoint_configuration {
#     types = ["REGIONAL"]
#   }
# 
#   # Enterprise: CloudWatch logging for API monitoring
#   # depends_on = [aws_cloudwatch_log_group.api_gw]
# 
#   tags = merge(var.tags, {
#     Name      = "${var.project_name}-api-gateway"
#     Component = "api-gateway"
#   })
# }

# Lambda function for retrieving blog posts
# resource "aws_lambda_function" "get_posts" {
#   filename      = var.lambda_deployment_package
#   function_name = "${var.project_name}-get-posts-${var.environment}"
#   role          = aws_iam_role.lambda_exec.arn
#   handler       = "index.handler"
#   runtime       = "nodejs18.x"
#   
#   # Enterprise: Optimized memory and timeout settings
#   memory_size = 128
#   timeout     = 10
# 
#   # Enterprise: Environment isolation for configuration
#   environment {
#     variables = {
#       TABLE_NAME  = var.dynamodb_table_name
#       STAGE       = var.environment
#     }
#   }
# 
#   # Enterprise: X-Ray tracing for distributed monitoring
#   tracing_config {
#     mode = "Active"
#   }
# 
#   tags = merge(var.tags, {
#     Name      = "${var.project_name}-get-posts-function"
#     Component = "lambda-get-posts"
#   })
# }

# IAM Role for Lambda execution with least privilege
# resource "aws_iam_role" "lambda_exec" {
#   name = "${var.project_name}-lambda-role-${var.environment}"
# 
#   # Enterprise: Secure role assumption policy
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "lambda.amazonaws.com"
#         }
#       }
#     ]
#   })
# 
#   tags = merge(var.tags, {
#     Name      = "${var.project_name}-lambda-execution-role"
#     Component = "iam-lambda-role"
#   })
# }

# ==============================================================================
# ACTIVE VALIDATION RESOURCES
# Zero-cost safety with count = 0
# ==============================================================================

# Validation API Gateway to demonstrate enterprise patterns
resource "aws_api_gateway_rest_api" "validation_example" {
  count = 0  # ZERO-COST SAFETY

  name        = "${var.project_name}-validation-not-created"
  description = "Enterprise pattern validation - count = 0 prevents creation"
  
  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-validation-api"
    Component = "api-validation"
  })
}