provider "aws" {
  access_key = "${env.AWS_ACCESS_KEY}"
  secret_key = "${env.AWS_SECRET_KEY}"
  region     = "ap-southeast-1"
}
