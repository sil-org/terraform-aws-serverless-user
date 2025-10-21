# Terraform module for creating an IAM user for the Serverless framework

This module creates an IAM user with a limited set of permissions such that the 
[Serverless](https://www.serverless.com/) 
framework can do its job of creating and deploying lambda functions. The IAM policy included
as the default policy is known to work in multiple situations in our context and can hopefully
be useful for others. Additional parameters are supported to augment or replace the policy 
if needed as well. 

This module is published in [Terraform Registry](https://registry.terraform.io/modules/sil-org/serverless-user/aws/latest).

## Required Inputs
 - `app_name`   - A short name for this application, example: `backup-service`. Must be 24 characters or less, including the stage name and a hyphen. If only one stage is used, the app_name can use the entire 24 characters."

## Optional Inputs 
 - `aws_region_policy`  - The region to use in creating the IAM policy document. Use "*" to allowing deployment to all regions. Default: `"us-east-1"`
 - `extra_policies`     - Optionally provide additional inline policies to attach to user. Default: `[]`
 - `policy_override`    - Optionally provide a json policy to use instead of default. Default: `""`
 - `username`           - Optionally provide a username for the serverless user. It defaults to `app_name-serverless`
 - `enable_api_gateway` - Optionally enable API Gateway related permissions. 
                          Needed for lambda functions that will be accessed via URL endpoints. Default: `false` 

## Outputs
 - `aws_access_key_id`      - The new IAM user's access key ID
 - `aws_secret_access_key`  - The new IAM user's secret access key

## Usage Example

```hcl
module "serverless-user" {
  source = "sil-org/serverless-user/aws"
  version = "0.1.0"
  
  app_name = "serverless-user"
}

output "serverless-user-access-key-id" {
  value = module.serverless-user.aws_access_key_id
}
output "serverless-user-secret-access-key" {
  value     = module.serverless-user.aws_secret_access_key
  sensitive = true
}
```


## License - MIT
MIT License

Copyright (c) 2021 SIL International

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
