/* provider "aws" {
  region = "eu-central-1"
}
provider "aws" {
  region = "us-east-1"
  alias  = "useast1"
} */

/* module "cur_destination" {
  #source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-destination"
  source = "./terraform-modules/cur-setup-destination"
  source_account_ids = ["797078318809","611960772844","450683952831"]
  create_cur         = true # Set to true to create an additional CUR in the aggregation account

  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  providers = {
    aws.useast1 = aws.useast1
  }
} */

provider "aws" {
  profile = "src1"
  region  = "eu-central-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "src1"
}

provider "aws" {
  profile = "src1"
  region  = "us-east-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "src1_useast1"
}
provider "aws" {
  profile = "src2"
  region  = "eu-central-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "src2"
}

provider "aws" {
  profile = "src2"
  region  = "us-east-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "src2_useast1"
}
provider "aws" {
  profile = "src3"
  region  = "eu-central-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "src3"
}

provider "aws" {
  profile = "src3"
  region  = "us-east-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "src3_useast1"
}

provider "aws" {
  profile = "dst"
  region  = "eu-central-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "dst"
}

provider "aws" {
  profile = "dst"
  region  = "us-east-1"
  shared_credentials_files  = ["C:/Users/balaswamy.kotaru/.aws/credentials"]
  alias   = "dst_useast1"
} 

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "useast1"
}

# Configure exactly one destination account
module "cur_destination" {
  #source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-destination"
  source = "./terraform-modules/cur-setup-destination"
  source_account_ids = ["797078318809","611960772844","450683952831"]
  create_cur         = true # Set to true to create an additional CUR in the aggregation account

  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  # Optionally, you may pass the default aws provider explicitly as well
  providers = {
    aws         = aws.dst
    aws.useast1 = aws.dst_useast1
  }
}

# Configure one or more source (payer) accounts
 module "cur_source1" {
  #source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-source"
  source = "./terraform-modules/cur-setup-source"
  destination_bucket_arn = module.cur_destination.cur_bucket_arn

  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  # Optionally, you may pass the default aws provider explicitly as well
  providers = {
    aws         = aws.src1
    aws.useast1 = aws.src1_useast1
  }
}

 module "cur_source2" {
  #source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-source"
  source = "./terraform-modules/cur-setup-source"
  destination_bucket_arn = module.cur_destination.cur_bucket_arn

  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  # Optionally, you may pass the default aws provider explicitly as well
  providers = {
    aws         = aws.src2
    aws.useast1 = aws.src2_useast1
  }
} 
module "cur_source3" {
  #source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cur-setup-source"
  source = "./terraform-modules/cur-setup-source"
  destination_bucket_arn = module.cur_destination.cur_bucket_arn

  # Provider alias for us-east-1 must be passed explicitly (required for CUR setup)
  # Optionally, you may pass the default aws provider explicitly as well
  providers = {
    aws         = aws.src3
    aws.useast1 = aws.src3_useast1
  }
} 
/* 
module "cid_dashboards" {
    #source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cid-dashboards"
    source = "./terraform-modules/cid-dashboards"
    stack_name      = "Cloud-Intelligence-Dashboards"
    template_bucket = "mytestbucket123332"
  
    stack_parameters = {
      "PrerequisitesQuickSight"            = "yes"
      "PrerequisitesQuickSightPermissions" = "yes"
      "QuickSightUser"                     = "AWSReservedSSO_AdministratorAccess_1059b3bbeae60d00/balaswamy.kotaru@bsh-ac.cloud"
      "DeployCUDOSDashboard"               = "yes"
      "DeployCostIntelligenceDashboard"    = "yes"
      "DeployKPIDashboard"                 = "yes"
    }
}
 */
