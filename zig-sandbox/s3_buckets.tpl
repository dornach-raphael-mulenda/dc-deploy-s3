dc-dev-s3-bucket-databank:
  bucket: dc-dev-s3-bucket-databank
  enabled: true
  force_destroy: true 
  control_pobject_ownership: true
  object_ownership: "ObjectWriter"
  allowed_kms_key_arn: ${kms_key_s3_id}
  bucket_lifecycle_all_files: true
  bucket_expiration_days: 90
  server_side_encryption_configuration:
    bucket: dc-dev-s3-bucket-databank
    rule:
      bucket_key_enabled: true
      apply_server_side_encryption_by_default:
        kms_master_key_id: ${kms_key_s3_id}
        sse_algorithm: "aws:kms"
