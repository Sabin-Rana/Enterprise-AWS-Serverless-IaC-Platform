# ==============================================================================
# DATABASE MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the DynamoDB module configuration
# Variables control table configuration, capacity, and indexing strategies
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
  description = "Common tags applied to all database resources"
  type        = map(string)
  default     = {}
}

# Table Capacity Configuration
variable "posts_table_read_capacity" {
  description = "Read capacity units for posts table"
  type        = number
  default     = 5
}

variable "posts_table_write_capacity" {
  description = "Write capacity units for posts table"
  type        = number
  default     = 5
}

variable "projects_table_read_capacity" {
  description = "Read capacity units for projects table"
  type        = number
  default     = 5
}

variable "projects_table_write_capacity" {
  description = "Write capacity units for projects table"
  type        = number
  default     = 5
}

# Security and Compliance Configuration
variable "enable_point_in_time_recovery" {
  description = "Enable point-in-time recovery for data protection"
  type        = bool
  default     = true
}

variable "enable_encryption" {
  description = "Enable server-side encryption for all tables"
  type        = bool
  default     = true
}