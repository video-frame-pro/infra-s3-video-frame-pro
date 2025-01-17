output "s3_bucket_name" {
  description = "Nome do bucket S3"
  value       = aws_s3_bucket.video_frame_pro_s3.bucket
}

output "s3_bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.video_frame_pro_s3.arn
}