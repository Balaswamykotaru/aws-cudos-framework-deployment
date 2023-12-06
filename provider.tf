#scr1=org001
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
#scr2=idm-poc
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
#scr3=control-tower

provider "aws" {
  region  = "eu-central-1"
  alias   = "src3"
 assume_role {
    role_arn = var.src3_role_arn
  }
}

provider "aws" {
  region  = "us-east-1"
  alias   = "src3_useast1"
 assume_role {
    role_arn = var.src3_role_arn
  }
}
