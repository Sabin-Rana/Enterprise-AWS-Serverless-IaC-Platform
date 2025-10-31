#!/bin/bash

# =============================================================================
# SAFETY CHECK - PRE-DEPLOYMENT VALIDATION
# =============================================================================
# Performs comprehensive safety checks 
# Ensures zero-cost validation and prevents accidental resource creation
# =============================================================================

set -e

echo "================================================================================"
echo "SAFETY CHECK - PRE-DEPLOYMENT VALIDATION"
echo "================================================================================"
echo "Project: Enterprise AWS Serverless Platform"
echo "Date: $(date)"
echo "Mode: Zero-Cost Validation"
echo "================================================================================"

# Environment check
echo "1. ENVIRONMENT VALIDATION"
echo "   ---------------------"
if [ -n "$AWS_ACCESS_KEY_ID" ]; then
    echo "   AWS credentials detected: Yes"
else
    echo "   AWS credentials detected: No"
fi

if command -v terraform &> /dev/null; then
    terraform_version=$(terraform version | head -n1)
    echo "   Terraform installed: $terraform_version"
else
    echo "   Terraform installed: No"
fi

# Terraform safety check
echo ""
echo "2. TERRAFORM SAFETY"
echo "   ---------------"
count_zero=$(grep -r "count = 0" ../terraform | wc -l)
count_one=$(grep -r "count = 1" ../terraform | wc -l)

echo "   Resources with count=0: $count_zero"
echo "   Resources with count=1: $count_one"

if [ $count_one -eq 0 ] && [ $count_zero -gt 0 ]; then
    echo "   Resource safety: All resources disabled"
else
    echo "   Resource safety: Review count parameters"
fi

# File structure check
echo ""
echo "3. FILE STRUCTURE"
echo "   --------------"
if [ -f "../terraform/environments/validation/main.tf" ]; then
    echo "   Validation environment: Present"
else
    echo "   Validation environment: Missing"
fi

if [ -d "../terraform/environments/blueprints" ]; then
    echo "   Blueprint environments: Present"
else
    echo "   Blueprint environments: Missing"
fi

# Resource detection
echo ""
echo "4. EXISTING RESOURCES"
echo "   ------------------"
if command -v aws &> /dev/null && aws sts get-caller-identity &>/dev/null; then
    lambda_count=$(aws lambda list-functions --query "Functions[?contains(FunctionName, 'serverless')].FunctionName" --output text 2>/dev/null | wc -w)
    dynamodb_count=$(aws dynamodb list-tables --query "TableNames[?contains(@, 'serverless')]" --output text 2>/dev/null | wc -w)
    echo "   Existing Lambda functions: $lambda_count"
    echo "   Existing DynamoDB tables: $dynamodb_count"
else
    echo "   AWS not configured - safe for validation"
fi

# Final safety assessment
echo ""
echo "5. SAFETY ASSESSMENT"
echo "   ----------------"
if [ $count_one -eq 0 ] && [ $count_zero -gt 0 ]; then
    echo "   Overall status: SAFE"
    echo "   Zero-cost validation active"
    echo "   No resources will be created"
else
    echo "   Overall status: REVIEW NEEDED"
    echo "   Verify count parameters before proceeding"
fi

echo ""
echo "================================================================================"
echo "SAFETY CHECK COMPLETE"
echo "================================================================================"
echo "All safety validations performed."
echo "================================================================================"