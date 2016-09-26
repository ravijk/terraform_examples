/*
  Private Subnet
*/
resource "aws_subnet" "terraform-poc-pvtsbn" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block = "${var.private_subnet_cidr}"
  availability_zone = "${var.availability_zone}"

  tags {
    Name = "Private Subnet"
  }
}

resource "aws_route_table" "terraform-poc-pvtsbn" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.api.id}"
  }

  tags {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id = "${aws_subnet.terraform-poc-pvtsbn.id}"
  route_table_id = "${aws_route_table.terraform-poc-pvtsbn.id}"
}