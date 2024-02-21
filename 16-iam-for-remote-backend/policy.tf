resource "aws_iam_policy" "terraform_policy" {
  name = "terraform_policy_backend" 
  path = "/policy/terraform"
  description = "Terraform policy to acess s3 and dynamodb"
  policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "TerraformBackendDynamoS301",
              "Effect": "Allow",
              "Action": [
                  "dynamodb:PutItem",
                  "dynamodb:DeleteItem",
                  "dynamodb:GetItem"
              ],
              "Resource": "arn:aws:dynamodb:${var.region}:${var.aws-account-number}:table/${var.dynamodb-terraform-table}"
          },
          {
              "Effect": "Allow",
              "Action": "s3:ListBucket",
              "Resource": "arn:aws:s3:::${var.terraform-bucket-name}"
          },
          {
              "Effect": "Allow",
              "Action": [
                  "s3:GetObject",
                  "s3:PutObject"
              ],
              "Resource": "arn:aws:s3:::${var.terraform-bucket-name}/${var.terraform-state-file-path}"
          }
      ]
    }
  )

  depends_on = [ 
    aws_s3_bucket.s3_terraform_state,
    aws_s3_object.tf_state_folder,
    aws_dynamodb_table.dynamodb_terraform_state_lock
  ]
}

#aws iam create-policy –policy-name Custom-Terraform-Policy-Backend-April –policy-document file://backend-role-policy.json