#------------------------------------------------------------------------------#
# CUDOS  variable definition
#------------------------------------------------------------------------------#

variable "src1_role_arn" {
  type        = string
  description = "The ARN of the role you assume for deploying the component -
}

variable "src2_role_arn" {
  type        = string
  description = "Source account id to store Cost and Usage reports"
}

#variable "src1_role_arn" {
#  type        = string
#  description = "The ARN of the source account id to store Cost and Usage reports "
#}
