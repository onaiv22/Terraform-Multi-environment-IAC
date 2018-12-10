#create VPC
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = false
  tags {
      Name = "dev"
  }
}
resource "aws_subnet" "subnet" {
  count              = 3
  cidr_block         = "${element(var.sub-cidr,count.index)}"
  vpc_id             = "${aws_vpc.vpc.id}"
  availability_zone  = "${element(var.az,count.index)}"
  map_public_ip_on_launch = true
  tags{
    name = "dev_subnet"
 }
}
