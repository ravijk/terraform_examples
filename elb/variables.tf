variable "access_key" { 
  description = "AWS access key"
  default     = ""
}

variable "secret_key" { 
  description = "AWS secert access key"
  default = ""
}

variable "region"     { 
  description = "AWS region"
  default     = "us-east-1" 
}

variable "availability_zone"     { 
  description = "AWS availability zone"
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "Name of VPC"
  default     = "terraform-poc-vpc"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default = "10.0.1.0/24"
}

/* Ubuntu 14.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-049d8641" 
    us-east-1 = "ami-a6b8e7ce"
  }
}

variable "custom_tags" {
  description = "project specific tags"
  type = "map"
  default = {
    Project = "terraform poc"
    Deploymen_version = "1.1-alpha"
    Criticality = "24x7"
    Division = "CRM Systems"
  }
}
