data "archive_file" "visitor_counter" {
  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/build/visitor_counter.zip"
}

resource "aws_lambda_function" "visitor_counter" {
  function_name = "visitorCounter"
  role          = aws_iam_role.lambda.arn
  runtime       = "python3.14"
  handler       = "lambda_function.lambda_handler"
  memory_size   = 128
  timeout       = 3

  filename         = data.archive_file.visitor_counter.output_path
  source_code_hash = data.archive_file.visitor_counter.output_base64sha256
}