
# create IAM user
resource "aws_iam_user" "aws_iam_username" {
  name = var.iam_user_name
}

# attach aws managed policy
resource "aws_iam_user_policy_attachment" "aws_iam_user_policy" {
  user       = aws_iam_user.aws_iam_username.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# create access_key
resource "aws_iam_access_key" "aws_iam_user_access_key" {
  user = aws_iam_user.aws_iam_username.name
}