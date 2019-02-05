resource "aws_instance" "myinstance" {
  # count                       = "${length(var.public_subnet)}"
  count         = "${var.ec2_count}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"

  tags {
    Name = "${var.ec2_name}"
  }
}
