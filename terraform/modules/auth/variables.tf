# ==============================================================================
# AUTHENTICATION MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the Cognito authentication module
# Variables control user pool configuration, security, and application integration
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
  description = "Common tags applied to all authentication resources"
  type        = map(string)
  default     = {}
}

# User Pool Configuration
variable "minimum_password_length" {
  description = "Minimum password length for user accounts"
  type        = number
  default     = 8
}

variable "require_symbols" {
  description = "Require symbols in user passwords"
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Require numbers in user passwords"
  type        = bool
  default     = true
}

variable "require_uppercase" {
  description = "Require uppercase letters in user passwords"
  type        = bool
  default     = true
}

variable "require_lowercase" {
  description = "Require lowercase letters in user passwords"
  type        = bool
  default     = true
}

# Application Configuration
variable "callback_urls" {
  description = "List of allowed callback URLs for OAuth flows"
  type        = list(string)
  default     = ["http://localhost:3000"]
}

variable "logout_urls" {
  description = "List of allowed logout URLs"
  type        = list(string)
  default     = ["http://localhost:3000"]
}

# Security Configuration
variable "mfa_configuration" {
  description = "Multi-factor authentication configuration"
  type        = string
  default     = "OPTIONAL"
}

variable "advanced_security_mode" {
  description = "Advanced security mode for user pool"
  type        = string
  default     = "ENFORCED"
}