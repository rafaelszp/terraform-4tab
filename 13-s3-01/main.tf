#This group was created outside terraform
#so it needs to be declared as datasource to be used by tf
# command used to create the following group outside terraform: 'aws iam create-group --group-name finance-analysts'
data "aws_iam_group" "finance-data" {
  group_name = "finance-analysts"
}

resource "aws_s3_bucket" "finance" {
  bucket  = "finance-202402"
  tags    = {
    Description = "Finance and Payroll"
  }
}

resource "aws_s3_object" "finance-fev-24" {
  source     = "./report.txt"
  key         = "finance-fev-24.txt"
  bucket      = aws_s3_bucket.finance.id
}


#other option is to use the aws_iam_policy_document resource type
resource "aws_s3_bucket_policy" "s3-finance-policy" {
  bucket    = aws_s3_bucket.finance.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.finance.id}",
      "Principal": {
        "AWS": [
          "${data.aws_iam_group.finance-data.arn}" 
        ]
      }
    }
  ]
}
  EOF

}


