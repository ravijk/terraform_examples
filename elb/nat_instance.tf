
resource "aws_instance" "terraform-poc-nat" {
  ami = "ami-311a1a5b"
  availability_zone = "us-east-1a"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.terraform-poc-nat-sg.id}"]
  subnet_id = "${aws_subnet.terraform-poc-psbn.id}"
  source_dest_check = false
  associate_public_ip_address = true
  tags {
    Name = "VPC NAT"
  }
}