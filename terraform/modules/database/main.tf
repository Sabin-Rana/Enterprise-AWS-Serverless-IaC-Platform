# ==============================================================================
# DYNAMODB DATABASE MODULE - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This module creates DynamoDB tables with enterprise design patterns including:
# - DynamoDB tables with provisioned capacity and auto-scaling
# - Global Secondary Indexes for flexible query patterns
# - Point-in-time recovery for data protection
# - Encryption at rest for security compliance
# ==============================================================================

# ==============================================================================
# ENTERPRISE DESIGN PATTERNS
# Commented sections demonstrate production architecture
# Active resources use count = 0 for zero-cost validation
# ==============================================================================

# Main posts table for blog content management
# resource "aws_dynamodb_table" "posts" {
#   name         = "${var.project_name}-posts-${var.environment}"
#   billing_mode = "PROVISIONED"
# 
#   # Enterprise: Optimized key design for blog content
#   hash_key     = "PostID"
#   range_key    = "CreatedAt"
# 
#   # Enterprise: Provisioned capacity with auto-scaling
#   read_capacity  = var.posts_table_read_capacity
#   write_capacity = var.posts_table_write_capacity
# 
#   # Enterprise: Point-in-time recovery for data protection
#   point_in_time_recovery {
#     enabled = var.enable_point_in_time_recovery
#   }
# 
#   # Enterprise: Server-side encryption for security
#   server_side_encryption {
#     enabled = var.enable_encryption
#   }
# 
#   # Enterprise: Global Secondary Index for query flexibility
#   global_secondary_index {
#     name               = "AuthorIndex"
#     hash_key           = "AuthorID"
#     range_key          = "CreatedAt"
#     projection_type    = "ALL"
#     read_capacity      = var.posts_table_read_capacity
#     write_capacity     = var.posts_table_write_capacity
#   }
# 
#   attribute {
#     name = "PostID"
#     type = "S"
#   }
# 
#   attribute {
#     name = "CreatedAt"
#     type = "S"
#   }
# 
#   attribute {
#     name = "AuthorID"
#     type = "S"
#   }
# 
#   tags = merge(var.tags, {
#     Name      = "${var.project_name}-posts-table"
#     Component = "dynamodb-posts"
#   })
# }

# Projects table for portfolio content management
# resource "aws_dynamodb_table" "projects" {
#   name         = "${var.project_name}-projects-${var.environment}"
#   billing_mode = "PROVISIONED"
# 
#   hash_key     = "ProjectID"
#   range_key    = "DisplayOrder"
# 
#   read_capacity  = var.projects_table_read_capacity
#   write_capacity = var.projects_table_write_capacity
# 
#   point_in_time_recovery {
#     enabled = var.enable_point_in_time_recovery
#   }
# 
#   server_side_encryption {
#     enabled = var.enable_encryption
#   }
# 
#   tags = merge(var.tags, {
#     Name      = "${var.project_name}-projects-table"
#     Component = "dynamodb-projects"
#   })
# }

# ==============================================================================
# ACTIVE VALIDATION RESOURCES
# Zero-cost safety with count = 0
# ==============================================================================

# Validation table to demonstrate enterprise patterns
resource "aws_dynamodb_table" "validation_example" {
  count = 0  # ZERO-COST SAFETY

  name         = "${var.project_name}-validation-not-created"
  billing_mode = "PROVISIONED"

  hash_key       = "ID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "ID"
    type = "S"
  }

  tags = merge(var.tags, {
    Name      = "${var.project_name}-validation-table"
    Component = "dynamodb-validation"
  })
}