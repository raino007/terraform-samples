variable "environment" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "public1-cidr_block" {
  type = string
}
variable "public2-cidr_block" {
  type = string
}
variable "private1-cidr_block" {
  type = string
}
variable "private2-cidr_block" {
  type = string
}
variable "data1-cidr_block" {
  type = string
}

variable "data2-cidr_block" {
  type = string
}
variable "availability_zones" {
  type = list(string)
}
