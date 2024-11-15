provider "aws" {
    region = "af-south-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0f81de567630b94f5"
    instance_type = "t3.micro"
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticip.public_ip
}