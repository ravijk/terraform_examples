/* App servers */
resource "aws_instance" "api" {
  ami = "${lookup(var.amis, var.region)}"
  availability_zone = "us-east-1a"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["${aws_security_group.terraform-poc-api-sg.id}"]
  subnet_id = "${aws_subnet.terraform-poc-pvtsbn.id}"
  source_dest_check = false
  user_data = "${file("userdata.sh")}"
  tags = {
    Name = "terraform-poc-API-instance-${count.index}"
  }
}