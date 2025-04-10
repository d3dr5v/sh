#!/bin/bash

# Get a list of all AWS regions
regions=$(aws ec2 describe-regions --query "Regions[].RegionName" --output text)

# Iterate over each region and list RDS instances
for region in $regions; do
  echo "Listing RDS instances in region: $region"

  # List RDS instances in the current region
  aws rds describe-db-instances --region "$region" --query "DBInstances[].{DBInstanceIdentifier:DBInstanceIdentifier,DBInstanceClass:DBInstanceClass, Engine:Engine, DBInstanceStatus:DBInstanceStatus}" --output table

  echo "-----------------------------------------"
done
