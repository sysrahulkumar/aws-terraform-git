#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "= 5.0"
#    }
#  }
#}

#provider "aws"{
# region = "us-east-1"
# access_key = "AKIA246BBFWRNCS3GOIQ"
# secret_key = "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"
#}

resource "aws_eip" "lb1" {
vpc = true
}

output "eip" {
value = aws_eip.lb.public_ip
}

#resource "aws_s3_bucket" "mys3bucket" {
#bucket = "training-day-002"
#}

#output "mys3bucket" {
#value = aws_s3_bucket.mys3.bucket_domain_name
#}

resource "aws_instance" "myec2" {
ami = "ami-0715c1897453cabd1"
instance_type = "t2.micro"
}
resource "aws_eip" "lb1" {
vpc = true
}
resource "aws_eip_association" "eip_assoc" {
instance_id = aws_instance.myec2.id
allocation_id = aws_eip.lb1
}

#provider "github"{
#token = "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"
#}