provider "aws" {
  region = "us-east-1"
}

# Creating an IAM user named "myuser"
resource "aws_iam_user" "example" {
  name = "myuser"
}

# Creating an IAM policy named "mypolicy"
resource "aws_iam_policy" "example" {
  name        = "mypolicy"
  description = "My IAM policy"

  # Defining the JSON policy document
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "*"
    }
  ]
}
EOF
}

# Attaching the IAM policy to the IAM user
resource "aws_iam_user_policy_attachment" "example" {
  user       = aws_iam_user.example.name       # Referring to the IAM user created earlier
  policy_arn = aws_iam_policy.example.arn      # Referring to the IAM policy ARN (Amazon Resource Name)
}
