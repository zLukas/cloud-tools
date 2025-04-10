#!/bin/bash -e

 

TODAY=$(date  +%Y-%m-%d)
YESTERDAY=$(date -d yesterday +%Y-%m-%d)
DAILY_COSTS=$(aws ce get-cost-and-usage  \
    --time-period Start=${YESTERDAY},End=${TODAY} \
    --granularity "DAILY" \
    --metrics "UnblendedCost")

ACC_NUMBER="$(aws sts get-caller-identity | jq '.Account' | bc)"  # caller needs to have sts permission policy
COST="$( echo ${DAILY_COSTS} | jq '.ResultsByTime[0].Total.UnblendedCost.Amount' | bc)"
CURRENCY="$( echo ${DAILY_COSTS} | jq '.ResultsByTime[0].Total.UnblendedCost.Unit' | bc)"
FILE_NAME="aws_daily_billing-${YESTERDAY}.csv"
echo "cloudType, cloud account, date, Cost, Currency" > ${BILLING_FILE_NAME}
echo " AWS, ${ACC_NUMBER}, ${YESTERDAY}, ${COST}, ${CURRENCY}" >> ${BILLING_FILE_NAME}
echo "${BILLING_FILE_NAME}"

echo "creating daily billing ..."
BILLING=$(create_daily_report)
echo "billing ${BILLING} created "
