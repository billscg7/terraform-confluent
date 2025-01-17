
resource "aws_s3_bucket" "terraform_state" {
  bucket = "iac-cc"

  lifecycle {
    prevent_destroy = false
  }

}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "iac-cc"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}