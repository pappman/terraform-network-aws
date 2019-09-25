resource "aws_flow_log" "lab-flow" {
  iam_role_arn    = "${aws_iam_role.lab-flow-role.arn}"
  log_destination = "${aws_cloudwatch_log_group.lab-log-group.arn}"
  traffic_type    = "ALL"
  vpc_id          = "${aws_vpc.lab-vpc-local.id}"
}

resource "aws_cloudwatch_log_group" "lab-log-group" {
  name = "lab-networking"
}

resource "aws_iam_role" "lab-flow-role" {
  name = "lab-networking-vpcflow-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lab-flow-policy" {
  name = "lab-networking-vpcflow-policy"
  role = "${aws_iam_role.lab-flow-role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}