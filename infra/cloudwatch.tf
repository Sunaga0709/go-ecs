resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = "/aws/ecs/${local.project_name}"
  retention_in_days = 1
}
