provider "aws" {
  region  = local.general.aws_region
  profile = terraform.workspace

  default_tags {
    tags = {
      application      = local.general.application
      environment      = local.general.environment
      project          = local.general.project
      cost_center_code = "datacenter"
      timecontrol      = "fulltime"
      owner            = "devops@dornach.eu"
      creator          = "raphael.mulenda@dornach.eu"
      managed_by       = "terraform"
      git_repo         = "https://github.com/dornach-raphael-mulenda/dc-deploy-s3"
      map-migrated     = "d-server-00ulrewmxnep6c"
      region           = local.general.aws_region
    }
  }
}