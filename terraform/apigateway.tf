resource "aws_apigatewayv2_api" "api" {
  name          = "${var.project_name}-api"
  protocol_type = "HTTP"

}

resource "aws_apigatewayv2_integration" "login" {
  api_id             = aws_apigatewayv2_api.api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.login.invoke_arn
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "login" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /login"
  target    = "integrations/${aws_apigatewayv2_integration.login.id}"
}

resource "aws_apigatewayv2_route" "login_options" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "OPTIONS /login"
  target    = "integrations/${aws_apigatewayv2_integration.login.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "api_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.login.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_apigatewayv2_integration" "signup" {
  api_id             = aws_apigatewayv2_api.api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.signup.invoke_arn
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "signup" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /signup"
  target    = "integrations/${aws_apigatewayv2_integration.signup.id}"
}

resource "aws_apigatewayv2_route" "signup_options" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "OPTIONS /signup"
  target    = "integrations/${aws_apigatewayv2_integration.signup.id}"
}


resource "aws_lambda_permission" "signup_api_permission" {
  statement_id  = "AllowSignupInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.signup.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_apigatewayv2_integration" "events" {
  api_id             = aws_apigatewayv2_api.api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.events.invoke_arn
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "events" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /events"
  target    = "integrations/${aws_apigatewayv2_integration.events.id}"
}

resource "aws_apigatewayv2_route" "events_options" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "OPTIONS /events"
  target    = "integrations/${aws_apigatewayv2_integration.events.id}"
}

resource "aws_lambda_permission" "events_api_permission" {
  statement_id  = "AllowEventsInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.events.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

resource "aws_apigatewayv2_integration" "create_event" {
  api_id             = aws_apigatewayv2_api.api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.create_event.invoke_arn
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "create_event" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /event/create"
  target    = "integrations/${aws_apigatewayv2_integration.create_event.id}"
}

resource "aws_apigatewayv2_route" "create_event_options" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "OPTIONS /event/create"
  target    = "integrations/${aws_apigatewayv2_integration.create_event.id}"
}

resource "aws_lambda_permission" "create_event_api" {
  statement_id  = "AllowCreateEventInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.create_event.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

