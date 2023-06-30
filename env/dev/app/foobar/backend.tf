terraform {
  backend "s3" {
    bucket = "learn-ecs-terraform-tfstate"
    key    = "example/dev/app/foobar_v1.0.0.tfstate"
    region = "ap-northeast-1"
  }
}