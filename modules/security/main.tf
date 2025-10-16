resource "aws_iam_openid_connect_provider" "github" {
  url = var.github_oidc_url

  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = var.git_oidc_thumbprint_list
}
