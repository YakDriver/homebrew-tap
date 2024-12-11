# homebrew-tap

Homebrew is a popular package manager for macOS (and Linux) that simplifies the installation of software. It allows you to install, update, and manage software packages from the command line with ease. Homebrew uses a repository of formulae to manage the installation of software packages.

## Why Use an External Tap?

An external tap is a custom repository for Homebrew formulae. By using an external tap, you can access software packages that are not included in the default Homebrew repository. This is particularly useful for accessing specialized or niche software, or for getting the latest versions of software that may not yet be available in the main repository.

This tap, `YakDriver/homebrew-tap`, provides a collection of formulae for various HashiCorp tools and other utilities. It is updated daily to ensure you have access to the latest versions and improvements.

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
| boundary | 0.18.1 |
| consul | 1.20.1 |
| consul_aws | 0.1.3 |
| nomad | 1.9.3 |
| packer | 1.11.2 |
| packer_alpha | 1.12.0-alpha1 |
| packer_beta | 1.11.0-beta |
| sentinel | 0.29.0 |
| terraform | 1.10.2 |
| terraform_alpha | 1.11.0-alpha20241211 |
| terraform_beta | 1.10.0-beta1 |
| terraform_rc | 1.10.0-rc3 |
| tf_migrate_alpha | 0.0.2-alpha |
| tf_migrate_beta | 0.0.2-beta |
| tfproviderdocs | 0.16.6 |
| tfstacks | 0.6.0 |
| vault | 1.18.2 |
| waypoint | 0.11.4 |
