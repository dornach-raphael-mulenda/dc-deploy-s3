locals {
  # local envs
  prefix         = "a-${local.general.company}-${local.general.environment}"
  kms_key_ssm_id = data.aws_ssm_parameter.aws_kms_key_ssm.value

  # Load defaults and workspace variables
  general = merge(
    yamldecode(try(file("defaults/general.yaml"), "{}")),
    yamldecode(try(file("${terraform.workspace}/general.yaml"), "{}"))
  )



}
