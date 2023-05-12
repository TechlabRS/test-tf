terraform {
  backend "s3" {
    bucket = "heyitsmyb"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
