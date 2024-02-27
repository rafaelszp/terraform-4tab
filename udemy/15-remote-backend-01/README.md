#### Prereqs

```shell
aws s3api create-bucket --region us-east-1 --bucket my-example-terraform-state-bucket-01  
aws dynamodb create-table \
    --region us-east-1 \
    --table-name state-locking \
    --attribute-definitions \
        AttributeName=LockID,AttributeType=S \
    --key-schema \
        AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST  \
    --table-class STANDARD

```