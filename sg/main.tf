provider "aws" {
    region = "af-south-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0f81de567630b94f5"
    instance_type = "t3.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}