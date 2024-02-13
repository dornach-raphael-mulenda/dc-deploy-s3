output "s3_bucket_arn" {
  value = module.s3["dc-dev-s3-bucket-databank"].s3.s3_bucket_arn
}

# output "s3_bucket_policy" {
#   value = module.s3["dc-dev-s3-bucket-databank"].s3.s3_bucket_policy
# }

output "s3_bucket_id" {
  value = module.s3["dc-dev-s3-bucket-databank"].s3.s3_bucket_id
}

output "policies"{
    value =  module.policies.policies
}
output "policies_names"{
    value =  module.policies.policies_names
}

output "policies_arns"{
    value =  module.policies.policies_arns
}