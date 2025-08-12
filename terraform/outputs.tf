# outputs.tf - Output Values

output "website_url" {
  description = "URL of the website"
  value       = "https://${aws_cloudfront_distribution.website.domain_name}"
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.website.bucket
}

output "s3_bucket_website_endpoint" {
  description = "S3 bucket website endpoint"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.website.id
}

output "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = aws_cloudfront_distribution.website.arn
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.website.arn
}

output "deployment_commands" {
  description = "Commands to deploy website content"
  value = <<-EOT
    # Deploy website content:
    aws s3 sync ./website s3://${aws_s3_bucket.website.bucket} --delete
    
    # Invalidate CloudFront cache:
    aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.website.id} --paths "/*"
    
    # View website:
    open https://${aws_cloudfront_distribution.website.domain_name}
  EOT
}

output "infrastructure_summary" {
  description = "Summary of created infrastructure"
  value = {
    environment                = var.environment
    s3_bucket                 = aws_s3_bucket.website.bucket
    cloudfront_distribution   = aws_cloudfront_distribution.website.domain_name
    website_url              = "https://${aws_cloudfront_distribution.website.domain_name}"
    estimated_monthly_cost   = "~$1-5 USD (depending on traffic)"
    deployment_region        = var.aws_region
  }
}
