<<<<<<< HEAD
provider "aws" {
    region = "af-south-1"
}



variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = [ "Val1","Val2","Val3" ]
}

variable "mymap" {
    type = map(string)
    default = {
      "Key1" = "value1"
      "Key2" = "value2"
    }
}

variable "inputname" {
    type = string
    description = "Enter the name of the VPC"
}

resource "aws_vpc" "myvpc" {
	cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname
    }
}

output "vpcid" {
    value = aws_vpc.myvpc.id
}

variable "mytouple" {
    type = ([string , number, string])
    default = ["cat", 1 ,"dog"]
}

variable "myobject" {
    type = object({
      name = string,
      port = number,
      list = (number)
    })
    default = {
      name = "Justin"
      port = [22, 25 , 80]
    }
=======
provider "aws" {
    region = "af-south-1"
}



variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = [ "Val1","Val2","Val3" ]
}

variable "mymap" {
    type = map(string)
    default = {
      "Key1" = "value1"
      "Key2" = "value2"
    }
}

variable "inputname" {
    type = string
    description = "Enter the name of the VPC"
}

resource "aws_vpc" "myvpc" {
	cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname
    }
}

output "vpcid" {
    value = aws_vpc.myvpc.id
}

variable "mytouple" {
    type = ([string , number, string])
    default = ["cat", 1 ,"dog"]
}

variable "myobject" {
    type = object({
      name = string,
      port = number,
      list = (number)
    })
    default = {
      name = "Justin"
      port = [22, 25 , 80]
    }
>>>>>>> 3af5fe5 (first commit)
}