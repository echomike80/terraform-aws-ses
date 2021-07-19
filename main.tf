data "aws_iam_policy_document" "ses_sender" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_iam_user" "ses_sender" {
  count = var.enable_smtp_user_name ? 1 : 0
  name  = var.smtp_user_name
}

resource "aws_iam_access_key" "ses_sender" {
  count = var.enable_smtp_user_name ? 1 : 0
  user = aws_iam_user.ses_sender[0].name
}

resource "aws_iam_policy" "ses_sender" {
  count = var.enable_smtp_user_name ? 1 : 0
  name        = "ses_sender"
  description = "Allows sending of e-mails via Simple Email Service"
  policy      = data.aws_iam_policy_document.ses_sender.json
}

resource "aws_iam_user_policy_attachment" "ses_sender" {
  count = var.enable_smtp_user_name ? 1 : 0
  user       = aws_iam_user.ses_sender[0].name
  policy_arn = aws_iam_policy.ses_sender[0].arn
}