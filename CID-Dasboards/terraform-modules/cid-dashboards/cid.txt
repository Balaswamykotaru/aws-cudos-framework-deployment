provider "aws" {
  alias   = "dst"
  region = "eu-central-1"
}

# cid_dashboards 

module "cid_dashboards" {
    source = "github.com/aws-samples/aws-cudos-framework-deployment//terraform-modules/cid-dashboards"
    stack_name      = "Cloud-Intelligence-Dashboards"
    template_bucket = "bucket-cur-test"
   
    stack_parameters = {
      "PrerequisitesQuickSight"            = "yes"
      "PrerequisitesQuickSightPermissions" = "yes"
      "QuickSightUser"                     = "QS-Admin-1/QS-Admin"
      "DeployCUDOSDashboard"               = "yes"
      "DeployCostIntelligenceDashboard"    = "yes"
      "DeployKPIDashboard"                 = "yes"
    }
  providers = aws.dst
  }
