module "policies" {

  source = "git@github.com:Dornach/zig-module-iam?ref=v1.0.3"
  
  general  = local.general
  
  policies = yamldecode(data.template_file.policies.rendered)
  
}