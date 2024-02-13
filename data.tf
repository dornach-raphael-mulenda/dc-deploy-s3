data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_ssm_parameter" "aws_kms_key_ssm" {
    name = data.aws_region.current.name == "eu-central-1" ? "/${local.general.company}/security/kms-shared-keys/ssm" : "/${local.general.company}/security/kms-shared-keys-replicas/ssm"
}
data "aws_ssm_parameter" "aws_kms_key_s3" {
    name = data.aws_region.current.name == "eu-central-1" ? "/${local.general.company}/security/kms-shared-keys/s3" : "/${local.general.company}/security/kms-shared-keys-replicas/s3"
}

data "template_file" "s3" {
    template = "${file("${terraform.workspace}/s3_buckets.tpl")}"
    vars = {
        kms_key_s3_id = "${data.aws_ssm_parameter.aws_kms_key_s3.value}"
        account_id    = "${data.aws_caller_identity.current.account_id}"
        aws_region    = "${data.aws_region.current.name}"
        prefix        = local.prefix
    }
}

data "template_file" "policies" {
    template = "${file("${terraform.workspace}/policies.tpl")}"
    vars = {
        kms_key_s3_id              = "${data.aws_ssm_parameter.aws_kms_key_s3.value}"
        account_id                 = "${data.aws_caller_identity.current.account_id}"
        aws_region                 = "${data.aws_region.current.name}"  
        prefix                     = local.prefix
        company                    = local.general.company
        application                = local.general.application
        project                    = local.general.project
        env                        = local.general.environment
    }
}