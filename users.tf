resource "aws_iam_user" "user" {
  for_each = var.userlist
  name = each.value["name"]
  path = "/"
  force_destroy = true
}
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

resource "aws_iam_user_login_profile" "user" {
  for_each = var.userlist
  user = each.value["name"]
  pgp_key = "keybase:kishorebjv"
  depends_on = [time_sleep.wait_30_seconds]
}
