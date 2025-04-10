data "aws_caller_identity" "current" {}
locals {
    account_id = data.aws_caller_identity.current.account_id
}


resource "aws_s3_bucket" "cost_reports" {
  provider = aws.bucket_provider
  bucket = ${var.bucket_name}

  tags = {
    Name = "cost report bucket"
    owner = ${var.owner}
  }
  policy = <<-POLICY
{
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "billingreports.amazonaws.com"
            },
            "Action": [
                "s3:GetBucketAcl",
                "s3:GetBucketPolicy"
            ],
            "Resource":"arn:aws:s3:::${var.bucket_name}",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "arn:aws:cur:us-east-1:${locals.account_id}:definition/*", {
                      name = value
                    }
                    :definition/*",
                    "aws:SourceAccount": "${locals.account_id}"
                }
            }
        },
        {
            "Sid": "Stmt13",
            "Effect": "Allow",
            "Principal": {
                "Service": "billingreports.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "arn:aws:cur:us-east-1:${locals.account_id}:definition/*",
                    "aws:SourceAccount": "${locals.account_id}"
                }
            }
        }
    ]
}
POLICY
}