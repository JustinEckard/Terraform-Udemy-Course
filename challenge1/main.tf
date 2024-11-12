<<<<<<< HEAD
provider "aws" {
    region = "af-south-1"
}

resource "aws_vpc" "TerraformVPC" {
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "TerraformVPC"
    }
=======
provider "aws" {
    region = "af-south-1"
}

resource "aws_vpc" "TerraformVPC" {
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "TerraformVPC"
    }
>>>>>>> 3af5fe5 (first commit)
}