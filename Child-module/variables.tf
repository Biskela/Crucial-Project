variable "region" {
  default = "us-west-1"
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "public_sub_cidr" {
  default = "10.0.1.0/24"
}


variable "public_sub_cidr-2" {
  default = "10.0.2.0/24"
}



variable "private_sub_cidr" {
  default = "10.0.3.0/24"
}


variable "private_sub_cidr-2" {
  default = "10.0.4.0/24"
}


variable "instance-1" {
  description = "type of instance"
  default     = "t2.micro"
  type        = string
}


variable "instance-2" {
  description = "type of instance"
  default     = "t2.micro"
  type        = string
}
