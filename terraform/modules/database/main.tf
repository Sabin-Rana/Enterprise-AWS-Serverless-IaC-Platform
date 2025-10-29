# ==============================================================================
# DYNAMODB DATABASE MODULE - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This module creates DynamoDB tables with enterprise patterns including:
# - DynamoDB tables with provisioned capacity and auto-scaling
# - Global Secondary Indexes for flexible query patterns
# - Point-in-time recovery for data protection
# - Encryption at rest for security compliance
# ==============================================================================

# ==============================================================================
# DYNAMODB TABLE - BLOG POSTS STORAGE
# ==============================================================================

resource "aws_dynamodb_table" "posts" {
  # ============================================================================
  # DEPLOYMENT CONTROL - ZERO-COST VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Shows in terraform plan as "will not be created"
  #   - Demonstrates table schema, indexes, and capacity configuration
  #   - Maintains absolute zero-cost guarantee
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates actual DynamoDB table in AWS
  #   - Enables data storage and retrieval operations
  #   - Incurs DynamoDB storage and read/write capacity costs
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  name         = "${var.project_name}-posts-${var.environment}"
  billing_mode = "PROVISIONED"

  # Enterprise: Optimized key design for blog content
  hash_key     = "PostID"
  range_key    = "CreatedAt"

  # Enterprise: Provisioned capacity with auto-scaling
  read_capacity  = var.posts_table_read_capacity
  write_capacity = var.posts_table_write_capacity

  # Enterprise: Point-in-time recovery for data protection
  point_in_time_recovery {
    enabled = var.enable_point_in_time_recovery
  }

  # Enterprise: Server-side encryption for security
  server_side_encryption {
    enabled = var.enable_encryption
  }

  # Enterprise: Global Secondary Index for query flexibility
  global_secondary_index {
    name               = "AuthorIndex"
    hash_key           = "AuthorID"
    range_key          = "CreatedAt"
    projection_type    = "ALL"
    read_capacity      = var.posts_table_read_capacity
    write_capacity     = var.posts_table_write_capacity
  }

  attribute {
    name = "PostID"
    type = "S"
  }

  attribute {
    name = "CreatedAt"
    type = "S"
  }

  attribute {
    name = "AuthorID"
    type = "S"
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-posts-table"
    Component = "dynamodb-posts"
  })
}

# ==============================================================================
# DYNAMODB TABLE - PORTFOLIO PROJECTS STORAGE
# ==============================================================================

resource "aws_dynamodb_table" "projects" {
  # ============================================================================
  # DEPLOYMENT CONTROL - DATA STORAGE VALIDATION
  # ============================================================================
  # CURRENT: count = 0 (Validation Mode)
  #   - Demonstrates secondary table configuration in terraform plan
  #   - Shows capacity settings and security features
  #   - No DynamoDB storage or capacity costs incurred
  #
  # FOR DEPLOYMENT: Change to count = 1
  #   - Creates additional DynamoDB table for portfolio data
  #   - Enables separate data domain management
  #   - Incurs additional DynamoDB costs for storage and capacity
  #
  # VALIDATION VALUE: count = 0
  # DEPLOYMENT VALUE: count = 1
  # ============================================================================
  count = 0

  name         = "${var.project_name}-projects-${var.environment}"
  billing_mode = "PROVISIONED"

  hash_key     = "ProjectID"
  range_key    = "DisplayOrder"

  read_capacity  = var.projects_table_read_capacity
  write_capacity = var.projects_table_write_capacity

  point_in_time_recovery {
    enabled = var.enable_point_in_time_recovery
  }

  server_side_encryption {
    enabled = var.enable_encryption
  }

  attribute {
    name = "ProjectID"
    type = "S"
  }

  attribute {
    name = "DisplayOrder"
    type = "N"
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-projects-table"
    Component = "dynamodb-projects"
  })
}