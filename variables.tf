#------------------------------------------------------------------------------#
# CUDOS  variable definition
#------------------------------------------------------------------------------#

variable "src1_role_arn" {
  type        = string
  }
variable "src1_account_id" {
  type        = string
  description = "Source account id to store Cost and Usage reports"
}

variable "src2_role_arn" {
  type        = string
}
variable "src2_account_id" {
  type        = string
  description = "Source account id to store Cost and Usage reports"
}


