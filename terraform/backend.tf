terraform {
    backend "s3" { 
      bucket         = "song-tfstate" 
      key            = "terraform/terraform.tfstate" 
      region         = "ap-northeast-2"  
      encrypt        = true
      dynamodb_table = "terraform-lock" 
    }
}
