# terraform-aws-oidc-core

A reusable Terraform module that provisions and configures an **AWS OpenID Connect (OIDC) identity provider** for use with **GitHub Actions** and other trusted OIDC-based CI/CD workflows.

This module simplifies and standardizes the setup of AWS–GitHub OIDC trust, enabling **secure, keyless authentication** for CI/CD pipelines — without the need to store or rotate long-lived AWS credentials.

---

## 📘 Overview

Modern CI/CD workflows demand **secure and temporary authentication methods** that minimize credential exposure.
`terraform-aws-oidc-core` provides a **centralized and consistent implementation** of the AWS OIDC provider configuration that can be reused across multiple repositories and environments.

By defining the OIDC provider once, teams can:

* Improve **security** by eliminating static AWS access keys.
* Increase **consistency** across projects using a shared Terraform module.
* Simplify **management** and **auditing** of OIDC trust relationships.

---

## 🚀 Features

* Creates an **AWS IAM OIDC provider** for GitHub Actions.
* Accepts **custom OIDC URLs** and **thumbprint lists** for flexibility.
* Designed to be **referenced by multiple AWS accounts or projects**.
* Compatible with **cross-account role assumptions** using GitHub OIDC tokens.
* Provides a **foundation module** for higher-level Terraform projects.

---

## 🧩 Usage Example

```hcl
module "oidc_core" {
  source = "github.com/your-org/terraform-aws-oidc-core"

  github_oidc_url          = "https://token.actions.githubusercontent.com"
  github_oidc_thumbprints  = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}
```

This will create an **AWS OIDC identity provider** trusted by GitHub Actions.
You can then reference this OIDC provider in other Terraform modules to create IAM roles that trust GitHub repositories or organizations.

---

## 🔒 Why This Module Matters

This repository serves as a **core infrastructure component** for all future automation and CI/CD-related AWS projects within your organization.

### Key Benefits:

* **Centralized Trust:** Defines a single source of truth for OIDC integration, ensuring consistent configuration across all projects.
* **Scalability:** New repositories can onboard quickly without repeating provider setup.
* **Security by Design:** Encourages secure, temporary credentials aligned with AWS best practices.
* **Reduced Maintenance:** Eliminates the need to manage static credentials or replicate OIDC setups in multiple repos.

---

## 🏗️ Future Use Cases

* Integration with `terraform-aws-github-ci-role` modules to assign repository-specific IAM roles.
* Expansion to support other OIDC providers (e.g., GitLab, Bitbucket, or custom IdPs).
* Shared module for multi-account setups and cross-organization OIDC federation.

---

## 🧾 Inputs

| Name                      | Description                                                                                                                | Type           | Required |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------- | -------------- | -------- |
| `github_oidc_url`         | The OpenID Connect (OIDC) provider URL for GitHub Actions. Used by AWS to establish trust with GitHub’s identity provider. | `string`       | ✅ Yes    |
| `github_oidc_thumbprints` | A list of GitHub OIDC provider certificate thumbprints used by AWS to verify the IdP’s SSL/TLS certificate.                | `list(string)` | ✅ Yes    |

---

## 🧱 Outputs

| Name                | Description                               |
| ------------------- | ----------------------------------------- |
| `oidc_provider_arn` | The ARN of the created AWS OIDC provider. |
| `oidc_provider_url` | The OIDC provider URL configured in AWS.  |

---

## ⚙️ Prerequisites

* Terraform ≥ 1.5.0
* AWS Provider ≥ 5.0
* An AWS account with permissions to manage IAM identity providers

---

## 👥 Contributing

Contributions are welcome!
This module is designed as a **foundation** — feel free to extend it to support more providers, validations, or organizational use cases.

---

## 📄 License

MIT License — see [LICENSE](./LICENSE) for details.
