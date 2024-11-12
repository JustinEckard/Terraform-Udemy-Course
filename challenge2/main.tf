provider "aws" {
    region = "af-south-1"
}

resource "aws_instance" "DB_server" {
    ami = "ami-0f81de567630b94f5"
    tags = {
      Name = "DB Server"
    }
    instance_type = "t3.micro"
    security_groups = [ aws_security_group.webgroups.name ]
}

resource "aws_instance" "Web_server" {
    ami = "ami-0f81de567630b94f5"
    tags = {
      Name = "Web Server"
    }
    security_groups = [ aws_security_group.webgroups.name ]
    instance_type = "t3.micro"

    user_data = file("server-script.sh")  // This is called a bootstrap script
}

variable "port_rules" {
    type = list(number)
    default = [ 80,443 ]
}

resource "aws_security_group" "webgroups" {
    name = "Allow different ports" 

    dynamic ingress {
        iterator = port
        for_each = var.port_rules 
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]  //Allows everything IP related
        }
    }

    dynamic egress {
        iterator = port
        for_each = var.port_rules 
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"] //Allows everything IP related
        }
    }
}

resource "aws_eip" "webserverip" {
    instance = aws_instance.Web_server.id
}

output "Private_IP" {
    value = aws_instance.DB_server.private_ip
}
output "Public_IP" {
    value = aws_eip.webserverip.public_ip
}

