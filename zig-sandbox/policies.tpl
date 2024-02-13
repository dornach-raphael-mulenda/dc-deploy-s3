[
  {
    "name": "dc-aws-s3-policy",
    "version": "2012-10-17",
    "statements": [
      {
        "actions": [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        "effect": "Allow",
        "resources": [
          "arn:aws:s3:::a-zig-san-s3-dc-dev-s3-bucket-databank/*",
          "arn:aws:s3:::a-zig-san-s3-dc-dev-s3-bucket-databank"
        ]
      },
      {
        "actions": [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey"
        ],
        "effect": "Allow",
        "resources": [
          "${kms_key_s3_id}"
        ]
      }
    ]
  }
]
