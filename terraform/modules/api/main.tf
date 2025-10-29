# ==============================================================================
# API GATEWAY & LAMBDA MODULE - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This module creates API Gateway and Lambda functions with enterprise patterns including:
# - API Gateway REST API with regional endpoints
# - Lambda functions with production configuration
# - IAM roles with least privilege principles
# - Integration between API Gateway and Lambda functions
# ==============================================================================

# ==============================================================================
# API GATEWAY REST API - PRODUCTION ARCHITECTURE
# ==============================================================================

resource "aws_api_gateway_rest_api" "main" {
  # ============================================================================
  # DEPLOYMENT CONTROL - ZERO-COST VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Shows in terraform plan as "will not be created"
  #   - Demonstrates REST API configuration and endpoint setup
  #   - Maintains absolute zero-cost guarantee
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual API Gateway REST API in AWS
  #   - Enables API endpoint creation and management
  #   - Incurs API Gateway request and data transfer costs
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  name        = "${var.project_name}-${var.environment}"
  description = "Serverless Portfolio API with blog functionality - ${var.environment}"

  # Enterprise: Regional endpoints for reduced latency
  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-api-gateway"
    Component = "api-gateway"
  })
}

# ==============================================================================
# LAMBDA FUNCTION - BLOG POSTS RETRIEVAL
# ==============================================================================

resource "aws_lambda_function" "get_posts" {
  # ============================================================================
  # DEPLOYMENT CONTROL - ARCHITECTURE VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Demonstrates Lambda configuration in terraform plan
  #   - Shows runtime, memory, timeout, and environment variables
  #   - No Lambda invocation or compute costs incurred
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual Lambda function in AWS
  #   - Enables serverless code execution
  #   - Incurs Lambda invocation and duration costs
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  filename      = var.lambda_deployment_package
  function_name = "${var.project_name}-get-posts-${var.environment}"
  role          = "arn:aws:iam::placeholder:role/lambda-role"  # Would reference actual IAM role
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  
  # Enterprise: Optimized memory and timeout settings
  memory_size = 128
  timeout     = 10

  # Enterprise: Environment isolation for configuration
  environment {
    variables = {
      TABLE_NAME  = var.dynamodb_table_name
      STAGE       = var.environment
    }
  }

  # Enterprise: X-Ray tracing for distributed monitoring
  tracing_config {
    mode = "Active"
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-get-posts-function"
    Component = "lambda-get-posts"
  })
}

# ==============================================================================
# IAM ROLE - LAMBDA EXECUTION WITH LEAST PRIVILEGE
# ==============================================================================

resource "aws_iam_role" "lambda_exec" {
  # ============================================================================
  # DEPLOYMENT CONTROL - SECURITY VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Shows IAM role configuration in terraform plan
  #   - Demonstrates least privilege and assume role policies
  #   - No IAM resource creation in AWS account
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual IAM role for Lambda execution
  #   - Enables secure function execution with defined permissions
  #   - No direct cost for IAM roles
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  name = "${var.project_name}-lambda-role-${var.environment}"

  # Enterprise: Secure role assumption policy
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(var.tags, {
    Name      = "${var.project_name}-lambda-execution-role"
    Component = "iam-lambda-role"
  })
}

# ==============================================================================
# API GATEWAY INTEGRATION - LAMBDA PROXY SETUP
# ==============================================================================

resource "aws_api_gateway_integration" "posts_integration" {
  # ============================================================================
  # DEPLOYMENT CONTROL - INTEGRATION VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Demonstrates API Gateway to Lambda integration pattern
  #   - Shows proxy configuration and method setup
  #   - Maintains zero-cost validation approach
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual integration between API Gateway and Lambda
  #   - Enables HTTP requests to trigger Lambda functions
  #   - Part of API Gateway configuration (no additional cost)
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  rest_api_id             = "placeholder-api-id"  # Would reference actual API Gateway
  resource_id             = "placeholder-resource-id"
  http_method             = "GET"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "placeholder-lambda-invoke-arn"  # Would reference actual Lambda
}