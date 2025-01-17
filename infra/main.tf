provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "video_frame_pro_s3" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.video_frame_pro_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.video_frame_pro_s3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.video_frame_pro_s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.video_frame_pro_s3.id

  rule {
    id     = "expire-objects-after-1-day"
    status = "Enabled"

    filter {
      prefix = "" # Aplica a regra a todos os objetos do bucket
    }

    expiration {
      days = 1 # Exclui os objetos 1 dia após o upload
    }
  }
}
