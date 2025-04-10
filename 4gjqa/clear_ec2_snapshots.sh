#!/bin/bash

REGION="ap-southeast-2"

CURRENT_DATE=$(date +%s)

SNAPSHOTS=$(aws ec2 describe-snapshots --owner-ids self --region $REGION --query "Snapshots[*].[SnapshotId,StartTime]" --output json)

echo "$SNAPSHOTS" | jq -c '.[]' | while read -r snapshot; do
    SNAPSHOT_ID=$(echo "$snapshot" | jq -r '.[0]')
    START_TIME=$(echo "$snapshot" | jq -r '.[1]')
    
    SNAPSHOT_DATE=$(date -d "$START_TIME" +%s)

    AGE=$(( (CURRENT_DATE - SNAPSHOT_DATE) / 86400 ))

    if [ $AGE -gt 7 ]; then
        echo "Deleting snapshot $SNAPSHOT_ID which is $AGE days old."
        aws ec2 delete-snapshot --snapshot-id $SNAPSHOT_ID --region $REGION
    fi
done
