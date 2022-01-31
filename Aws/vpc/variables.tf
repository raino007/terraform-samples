variable "environment" {}
variable "cidr_block" {}
variable "public1-cidr_block" {}
variable "public2-cidr_block" {}
variable "private1-cidr_block" {}
variable "private2-cidr_block" {}

variable "data1-cidr_block" {
  
}

variable "data2-cidr_block" {
  
}
variable "availability_zones" {
  type = list(string)
}
