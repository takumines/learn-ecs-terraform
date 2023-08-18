terraform {
  backend "s3" {
    bucket  = "learn-ecs-terraform-tfstate"
    key     = "example/dev/routing/appfoobar_v1.0.0.tfstate"
    region  = "ap-northeast-1"
    profile = "terraform"
  }
}