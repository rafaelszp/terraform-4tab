#### Prereqs

```shell
aws s3api create-bucket --region us-east-1 --bucket my-example-terraform-state-bucket-01  

aws dynamodb create-table \
    --table-name state-locking \
    --attribute-definitions \
        AttributeName=lockID,AttributeType=S \
    --key-schema \
        AttributeName=lockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --table-class STANDARD \
    --region us-east-1
```