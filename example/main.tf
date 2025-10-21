module "serverless-user" {
  source  = "sil-org/serverless-user/aws"
  version = ">= 0.1.3"

  app_name = "serverless-user"

  username = "app_serverless_username"
  extra_policies = jsonencode([
    {
      Version = "2012-10-17",
      Statement = [
        {
          Effect = "Allow",
          Action = [
            "ec2:CreateTags",
            "ec2:DeleteTags",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcs",
            "iam:getRolePolicy",
            "logs:FilterLogEvents"
          ],
          "Resource" : "*"
        }
      ]
    }
  ])
}
