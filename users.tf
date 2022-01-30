resource "aws_iam_user" "user" {
  for_each = var.userlist
  name = each.value["name"]
  path = "/"
  force_destroy = true
}

# User creation might take 2+ seconds, So creating a dummy a resource to hold execution for 30seconds.
# Without this resource other resources creation might fail with 404 errors.

resource "time_sleep" "wait_30_seconds" {
  for_each = var.userlist
  create_duration = "30s"
  depends_on = [aws_iam_user.user]
}

resource "aws_iam_access_key" "user" {
  for_each = var.userlist
  user = each.value["name"]
  depends_on = [time_sleep.wait_30_seconds]
}

# As of today, terraform allowing AWS IAM User passwords as pgpkeys only, so there is neccessary of creation an account in https://keybase.io/ & then specify the user in pgp_key field.
# Without keybase account this resource fail to create.
resource "aws_iam_user_login_profile" "user" {
  for_each = var.userlist
  user = each.value["name"]
  pgp_key = "keybase:kishorebjv"
  depends_on = [time_sleep.wait_30_seconds]
}
