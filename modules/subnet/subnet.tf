resource "aws_subnet" "publicsubnet1" {
  # count             = "${var.subnet_count}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.azs}"

  tags = {
    Name = "${var.subnet_name}"
  }
}

output "subnet_id" {
  value = "${aws_subnet.publicsubnet1.*.id}"
}
