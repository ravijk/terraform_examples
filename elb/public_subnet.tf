/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "terraform-poc-ig" {
  vpc_id = "${aws_vpc.default.id}"
  tags { 
    Name = "terraform-poc-gateway"
    Project = "My project"

  }
}

/* Public subnet */
resource "aws_subnet" "terraform-poc-psbn" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "${var.availability_zone}"
  map_public_ip_on_launch = true
  depends_on = ["aws_internet_gateway.terraform-poc-ig"]
  tags { 
    Name = "terraform-poc-subnet"
  }
}

/* Routing table for public subnet */
resource "aws_route_table" "terraform-poc-routetable" {
  vpc_id = "${aws_vpc.default.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.terraform-poc-ig.id}"
  }
  tags { 
    Name = "terraform-poc-routetable"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "public" {
  subnet_id = "${aws_subnet.terraform-poc-psbn.id}"
  route_table_id = "${aws_route_table.terraform-poc-routetable.id}"
}
