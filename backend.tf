terraform {
  backend "s3" {
    bucket         = "a-zig-prd-s3-tfbackend-tfstatefiles"
    key            = "amazone-s3-infra.tfstate"
    dynamodb_table = "a-zig-ddb-tfbackend-tfstatelock"
    region         = "eu-central-1"
    profile        = "zig-shared-services"
  }
}