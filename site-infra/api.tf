resource "aws_apigatewayv2_api" "visitor_counter" {
  name          = "visitorCountAPI"
  protocol_type = "HTTP"

  cors_configuration {
    allow_credentials = false
    allow_headers     = ["*"]
    allow_methods     = ["GET", "OPTIONS"]
    allow_origins     = ["*"]
    max_age           = 0
  }
}

resource "aws_apigatewayv2_integration" "visitor_counter" {
  api_id                 = aws_apigatewayv2_api.visitor_counter.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.visitor_counter.arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "visitor_counter" {
  api_id             = aws_apigatewayv2_api.visitor_counter.id
  route_key          = "GET /visitorCount"
  target             = "integrations/${aws_apigatewayv2_integration.visitor_counter.id}"
  authorization_type = "NONE"
}

resource "aws_apigatewayv2_stage" "production" {
  api_id      = aws_apigatewayv2_api.visitor_counter.id
  name        = "production"
  auto_deploy = true
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "b0ab3ef7-dbcb-5294-b72c-2613a65a4674"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.visitor_counter.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:eu-west-1:301178568467:x29nzwmwka/*/*/visitorCount"
}