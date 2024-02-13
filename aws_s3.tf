module "s3" {
  source                = "git@github.com:Dornach/zig-module-s3?ref=v2.3.0"
  for_each              = yamldecode(data.template_file.s3.rendered)
  general               = local.general
  s3                    = each.value
}


resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = module.s3["dc-dev-s3-bucket-databank"].s3.s3_bucket_id
  policy = jsonencode(jsondecode(module.policies.policies))
}