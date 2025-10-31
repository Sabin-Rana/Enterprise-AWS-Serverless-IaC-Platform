#!/bin/bash

# =============================================================================
# EMERGENCY STOP - COST CONTAINMENT
# =============================================================================
# Provides emergency procedures for cost containment
# Documents shutdown procedures without automatic execution
# =============================================================================

set -e

echo "================================================================================"
echo "EMERGENCY STOP - COST CONTAINMENT PROCEDURES"
echo "================================================================================"
echo "Project: Enterprise AWS Serverless Platform"
echo "Date: $(date)"
echo "Mode: Documentation Only - No Automatic Execution"
echo "================================================================================"

# Current status
echo "1. CURRENT STATUS"
echo "   -------------"
count_zero=$(grep -r "count = 0" ../terraform | wc -l)
count_one=$(grep -r "count = 1" ../terraform | wc -l)

if [ $count_one -eq 0 ] && [ $count_zero -gt 0 ]; then
    echo "   Resource status: Zero-cost validation"
    echo "   Emergency stop: Not needed"
    echo "   AWS costs: $0.00"
else
    echo "   Resource status: Active deployment"
    echo "   Emergency stop: Procedures below"
    echo "   AWS costs: Monitor carefully"
fi

# Emergency procedures
echo ""
echo "2. EMERGENCY PROCEDURES"
echo "   -------------------"
echo "   Manual termination steps:"
echo "   1. Identify running resources:"
echo "      aws lambda list-functions"
echo "      aws dynamodb list-tables"
echo "      aws apigateway get-rest-apis"
echo ""
echo "   2. Terminate Lambda functions:"
echo "      aws lambda delete-function --function-name NAME"
echo ""
echo "   3. Delete DynamoDB tables:"
echo "      aws dynamodb delete-table --table-name NAME"
echo ""
echo "   4. Remove API Gateway APIs:"
echo "      aws apigateway delete-rest-api --rest-api-id ID"
echo ""
echo "   5. Clean up other resources:"
echo "      Check CloudWatch, S3, CloudFront, Cognito"

# Cost monitoring
echo ""
echo "3. COST MONITORING"
echo "   --------------"
echo "   Check current costs:"
echo "   aws ce get-cost-and-usage --time-period Start=2024-01-01,End=2024-01-31 --granularity MONTHLY --metrics UnblendedCost"
echo ""
echo "   Set up budget alerts:"
echo "   aws budgets create-budget --account-id ACCOUNT --budget file://budget.json --notifications-with-subscribers file://notifications.json"

# Prevention measures
echo ""
echo "4. PREVENTION MEASURES"
echo "   ------------------"
echo "   Always use validation mode first"
echo "   Set all resources to count = 0 initially"
echo "   Use Terraform plan to verify before apply"
echo "   Set up AWS Budgets with alerts"
echo "   Use free-tier eligible services"
echo "   Monitor Cost Explorer regularly"

# Recovery steps
echo ""
echo "5. RECOVERY STEPS"
echo "   -------------"
echo "   After emergency stop:"
echo "   1. Verify all resources terminated"
echo "   2. Check Cost Explorer for final costs"
echo "   3. Review what went wrong"
echo "   4. Update safety procedures"
echo "   5. Restore with count = 0 for validation"

echo ""
echo "================================================================================"
echo "EMERGENCY PROCEDURES DOCUMENTED"
echo "================================================================================"
echo "All emergency stop procedures documented."
echo "Maintain zero-cost validation to prevent need for emergency stops."
echo "================================================================================"