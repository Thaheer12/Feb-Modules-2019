resource "aws_vpc" "myvpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tendency}"

  tags {
    Name = "${var.vpc_name}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.myvpc.id}"
}
