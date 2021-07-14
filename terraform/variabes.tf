#### terraform ####
variable "region" {
  default = ""
}
variable "terraform_bucket" {
  default = ""
}

variable "project" {
  default = ""
}
#####ec2 network ######
variable "vpc_name" {
  default = ""
}

variable "cidr" {
  default = ""
}

variable "cicd_subnet" {
  default = ""
}
variable "db_subnet" {
  default = ""
}

#####ec2 instance ######
variable "public_key" {
  default = ""
}

variable "ami" {
  default = ""
}
variable "instance_type" {
  default = ""
}
#### database ####
variable "database_storage" {
  default = ""
}
variable "engine_version" {
  default = ""
}
variable "database_type" {
  default = ""
}
variable "database_name" {
  default = ""
}
variable "database_password" {
  default = ""
  sensitive = true
}
variable "database_username" {
  default = ""
}
variable "database_port" {
  default = ""
}
#### s3 bucket ###
variable "web_domain" {
  default = ""
}