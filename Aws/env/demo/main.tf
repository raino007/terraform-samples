##demo
## This will create vpc with 2 pub subnet,2 pvt subnet,routetable,IGW,Nat Gateway
module "demo-vpc" {
  source              = "../../vpc"
  environment         = "demo"
  cidr_block          = "10.4.0.0/16"
  public1-cidr_block  = "10.4.1.0/24"
  public2-cidr_block  = "10.4.2.0/24"
  private1-cidr_block = "10.4.3.0/24"
  private2-cidr_block = "10.4.4.0/24"
  data1-cidr_block    = "10.4.5.0/24"
  data2-cidr_block    = "10.4.6.0/24"
  availability_zones  = ["us-east-1a", "us-east-1b"]
}