#!/bin/bash
set -e

STACK_NAME=kafka-b-poc
TEMPLATE=cloudformation.yaml

case "$1" in
  up)
    aws cloudformation deploy \
      --stack-name "$STACK_NAME" \
      --template-file "$TEMPLATE" \
      --capabilities CAPABILITY_IAM \
      --parameter-overrides \
        KeyName=n8n 
    ;;
  down)
    aws cloudformation delete-stack \
      --stack-name "$STACK_NAME"
    ;;
  status)
    aws cloudformation describe-stacks  \
      --stack-name "$STACK_NAME"
    ;;
  exec)
    ssh -i ../n8n.pem ec2-user@"$2" "sudo tail -f /var/log/cloud-init-output.log" 
    ;;
  *)
    echo "Uso:"
    echo "  $0 up <httpPort> <instanceType> <gameType> <user> <sizeLimit> <start> <end>"
    echo "  $0 down"
    exit 1
    ;;
esac
