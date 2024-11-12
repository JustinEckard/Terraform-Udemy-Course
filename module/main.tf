<<<<<<< HEAD
provider "aws" {
    region = "af-south-1"
}

module "ec2" {
    source = "./ec2"
    for_each = toset(["dev","test","prod"])
=======
provider "aws" {
    region = "af-south-1"
}

module "ec2" {
    source = "./ec2"
    for_each = toset(["dev","test","prod"])
>>>>>>> 3af5fe5 (first commit)
}