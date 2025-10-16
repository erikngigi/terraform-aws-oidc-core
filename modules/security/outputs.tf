output "github_oidc_arn" {
  description = "ARN value of the GitHub OIDC"
  value       = aws_iam_openid_connect_provider.github.arn
}
