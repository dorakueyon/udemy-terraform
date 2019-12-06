terraform {
  backend "s3" {
    bucket = "terraform-test-787890"
    key    = "terraform/demo4"
    region = "ap-northeast-1"
  }
}


