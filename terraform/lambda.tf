resource "aws_lambda_function" "login" {
  function_name = "login"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = var.lambda_runtime
  filename      = "../backend_lambda/login/login.zip"

  source_code_hash = filebase64sha256("../backend_lambda/login/login.zip")
}

resource "aws_lambda_function" "signup" {
  function_name = "signup"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = var.lambda_runtime
  filename      = "../backend_lambda/signup/signup.zip"

  source_code_hash = filebase64sha256("../backend_lambda/signup/signup.zip")
}

resource "aws_lambda_function" "events" {
  function_name = "get-events"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = var.lambda_runtime

  filename         = "../backend_lambda/events/events.zip"
  source_code_hash = filebase64sha256("../backend_lambda/events/events.zip")
}

resource "aws_lambda_function" "create_event" {
  function_name = "create-event"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = var.lambda_runtime

  filename         = "../backend_lambda/create_event/create-event.zip"
  source_code_hash = filebase64sha256("../backend_lambda/create_event/create-event.zip")
}

