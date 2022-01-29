resource "aws_iam_user_policy" "admin_policy" {
  user        = var.userlist.admin.name 
  name        = "admin_policy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
    })
   depends_on = [time_sleep.wait_30_seconds]
}

resource "aws_iam_user_policy" "ec2_readonly_policy" {
  user        = var.userlist.engineer.name 
  name        = "ec2_readonly_policy"
  depends_on = [time_sleep.wait_30_seconds]
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "${var.userlist.engineer.region}"
                }
             }
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:Describe*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "${var.userlist.engineer.region}"
                }
             }
        },
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:Describe*"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "${var.userlist.engineer.region}"
                }
             }
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:Describe*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "${var.userlist.engineer.region}"
                }
             }
        }
    ]
})
}
resource "aws_iam_user_policy" "readonly_policy" {
  user        = var.userlist.accountant.name 
  name        = "readonly_policy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "aws-portal:ViewBilling"
            ],
            "Resource": "*"
        }
    ]
   })
 depends_on = [time_sleep.wait_30_seconds]
}
