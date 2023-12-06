provider "aws" {
  alias   = "dst"
  region = "eu-central-1"
}
provider "aws" {
  region = "us-east-1"
  alias  = "dst_useast1"
}
# Destination account setup
module "cur_destination" {
  source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-destination"
  source_account_ids = ["797078318809","611960772844","450683952831"]
  create_cur         = false # Set to true to create an additional CUR in the aggregation account
  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  providers = {
    aws.useast1 = aws.dst_useast1
  }
}
