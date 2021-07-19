output "smtp_username" {
  value = var.enable_smtp_user_name ? aws_iam_access_key.ses_sender[0].id : null
}

output "smtp_password" {
  value = var.enable_smtp_user_name ? aws_iam_access_key.ses_sender[0].ses_smtp_password_v4 : null
}