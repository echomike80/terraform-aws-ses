variable "domain_name" {
  description = "A domain name that should be issued"
  type        = string
}

variable "enable_smtp_user_name" {
  description = "If true, then create SMTP user in IAM"
  type        = bool
  default     = false
}

variable "smtp_user_name" {
  description = "SMTP user name"
  type        = string
  default     = "ses-smtp-user"
}