provider "aws" {
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    apigateway     = "http://getin-rafael-vm:4566"
    apigatewayv2   = "http://getin-rafael-vm:4566"
    cloudformation = "http://getin-rafael-vm:4566"
    cloudwatch     = "http://getin-rafael-vm:4566"
    dynamodb       = "http://getin-rafael-vm:4566"
    ec2            = "http://getin-rafael-vm:4566"
    es             = "http://getin-rafael-vm:4566"
    elasticache    = "http://getin-rafael-vm:4566"
    firehose       = "http://getin-rafael-vm:4566"
    iam            = "http://getin-rafael-vm:4566"
    kinesis        = "http://getin-rafael-vm:4566"
    lambda         = "http://getin-rafael-vm:4566"
    rds            = "http://getin-rafael-vm:4566"
    redshift       = "http://getin-rafael-vm:4566"
    route53        = "http://getin-rafael-vm:4566"
    s3             = "http://getin-rafael-vm:4566"
    secretsmanager = "http://getin-rafael-vm:4566"
    ses            = "http://getin-rafael-vm:4566"
    sns            = "http://getin-rafael-vm:4566"
    sqs            = "http://getin-rafael-vm:4566"
    ssm            = "http://getin-rafael-vm:4566"
    stepfunctions  = "http://getin-rafael-vm:4566"
    sts            = "http://getin-rafael-vm:4566"
  }
}

resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = {
    Description = "Super admin group"
  }
}

resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"  
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
  }
  EOF
}
resource "aws_iam_policy" "adminUser_file" {
  name = "AdminUsers"  
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn
}