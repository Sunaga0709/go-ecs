terraform {
  backend "s3" {
    bucket       = "sunaga-sample"
    key          = "go-ecs/terraform.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true
    encrypt      = true
  }
}
