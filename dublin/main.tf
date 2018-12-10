provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

# networking

module "network" {
    source = "../modules/vpc"
    vpc-cidr = "${var.dublin-vpc-cidr}"
    sub-cidr = "${var.dublin-private-cidr}"
    az       = "${var.dublin-azs}"
}
