terraform {
  backend "s3" {
    bucket         = "sunaga-sample"
    key            = "go-ecs/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "sunaga-sample-go-ecs-tf-lock"
    encrypt        = true
  }
}
