
# S3 bucket for backend
resource "aws_s3_bucket" "tfstate" {
  bucket = "song-tfstate"
  force_destroy = true # to delete non-empty bucket

  versioning {
    enabled = true 
  }
}

# DynamoDB for terraform state lock
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

