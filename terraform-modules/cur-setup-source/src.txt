provider "aws" {
  region  = "eu-central-1"
  alias   = "src1"
  assume_role {
    role_arn = var.src1_role_arn
  }
}
provider "aws" {
  region  = "us-east-1"
  alias   = "src1_useast1"
  assume_role {
    role_arn = var.src1_role_arn
  }
}
provider "aws" {
  region  = "eu-central-1"
  alias   = "src2"
  assume_role {
    role_arn = var.src2_role_arn
  }
}
provider "aws" {
  region  = "us-east-1"
  alias   = "src2_useast1"
  assume_role {
    role_arn = var.src2_role_arn
  }
 }
# source1 (payer) account
 module "cur_source1" {
  source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-source"
  destination_bucket_arn = module.cur_destination.cur_bucket_arn
  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  # Optionally, you may pass the default aws provider explicitly as well
  providers = {
    aws         = aws.src1
    aws.useast1 = aws.src1_useast1
  }
}
# source2 (payer) account
 module "cur_source2" {
  source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-source"
  destination_bucket_arn = module.cur_destination.cur_bucket_arn
  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  # Optionally, you may pass the default aws provider explicitly as well
  providers = {
    aws         = aws.src2
    aws.useast1 = aws.src2_useast1
  }
}
