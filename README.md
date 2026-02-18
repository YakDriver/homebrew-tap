# homebrew-tap

Homebrew is a popular package manager for macOS (and Linux) that simplifies the installation of software. It allows you to install, update, and manage software packages from the command line with ease. Homebrew uses a repository of formulae to manage the installation of software packages.

## Why Use an External Tap?

An external tap is a custom repository for Homebrew formulae. By using an external tap, you can access software packages that are not included in the default Homebrew repository. This is particularly useful for accessing specialized or niche software, or for getting the latest versions of software that may not yet be available in the main repository.

This tap, `YakDriver/homebrew-tap`, provides a collection of formulae for various HashiCorp tools and other utilities. It is updated daily to ensure you have access to the latest versions and improvements.

## ⚠️ Important Note on terraform_latest

The `terraform_latest` formula installs the absolute latest version of Terraform available, which may be an alpha, beta, rc, or stable release. This formula is for users who want cutting-edge features and accept the risk of potential breaking changes or instability. For production use, consider using the specific `terraform`, `terraform_rc`, `terraform_beta`, or `terraform_alpha` formulae instead.

## Installation

To use this tap, you need to add it to your Homebrew configuration. You can then install the available formulae using the `brew install` command. For example:

### Taps

```sh
brew install YakDriver/tap/boundary
brew install YakDriver/tap/consul
brew install YakDriver/tap/consul_aws
brew install YakDriver/tap/nomad
brew install YakDriver/tap/packer
brew install YakDriver/tap/packer_alpha
brew install YakDriver/tap/packer_beta
brew install YakDriver/tap/sentinel
brew install YakDriver/tap/terraform
brew install YakDriver/tap/terraform_alpha
brew install YakDriver/tap/terraform_beta
brew install YakDriver/tap/terraform_latest
brew install YakDriver/tap/terraform_rc
brew install YakDriver/tap/tf_migrate_alpha
brew install YakDriver/tap/tf_migrate_beta
brew install YakDriver/tap/tfproviderdocs
brew install YakDriver/tap/tfstacks
brew install YakDriver/tap/vault
brew install YakDriver/tap/waypoint
```

### Current Versions

| Tap | Version |
| --- | --- |
| boundary | 0.21.1 |
| consul | 1.22.3 |
| consul_aws | 0.1.3 |
| nomad | 1.11.2 |
| packer | 1.15.0 |
| packer_alpha | 1.12.0-alpha1 |
| packer_beta | 1.11.0-beta |
| sentinel | 0.40.0 |
| terraform | 1.14.5 |
| terraform_alpha | 1.15.0-alpha20260218 |
| terraform_beta | 1.14.0-beta3 |
| terraform_latest | 1.15.0-alpha20260218 |
| terraform_rc | 1.14.0-rc2 |
| tf_migrate_alpha | 1.3.0-alpha20251003 |
| tf_migrate_beta | 2.0.0-beta3 |
| tfproviderdocs | 0.24.1 |
| tfstacks | 1.2.0 |
| vault | 1.21.3 |
| waypoint | 0.11.4 |
