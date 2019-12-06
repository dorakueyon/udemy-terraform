provider "aws" {
	
}
variable "AWS_REGION" {
	type = string
}

variable "AMIS" {
	type = map(string)
	default = {
		ap-northeast-1 = "my ami"
	}
}

resource "aws_instance" "example_1" {
	ami = var.AMIS[var.AWS.REGION]
	instance_type = "ts.micro"
}

resource "aws_instance" "example_2" {
	ami = var.AMIS[var.AWS.REGION]
	instance_type = "ts.micro"
}
