#!/bin/bash

#######################
# Author: Tushar Riyat
# Date: 11th Jan
#
# Version: v1
# 
# This script will report the AWS resource usage of AWS EC2 instanceId, AWS s3, AWS lambda functions, AWS IAM users
# Inorder to make a automated report at 6 PM with there details we execute the crontab with this script: 0 18 * * * ./awsResourceTracker.sh
#######################

#AWS EC2 instancesId list
echo "AWS EC2 instances lists"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' > resourceTracker.txt

#AWS s3 buckets list
echo "AWS s3 Buckets lists"
aws s3 ls >> resourceTracker.txt

#AWS list of lambda functions
echo "AWS list of lambda functions"
aws lambda list-functions >> resourceTracker.txt

# AWS list IAM users
echo "AWS list of IAM users"
aws iam list-users >> resourceTracker.txt