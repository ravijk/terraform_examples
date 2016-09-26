/* App servers */
resource "aws_instance" "app" {
  count = 2
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.terraform-poc-psbn.id}"
  security_groups = ["${aws_security_group.terraform-poc-sg.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  source_dest_check = false
  user_data = "${file("userdata.sh")}"
  tags = {
    Name = "terraform-poc-web-instance-${count.index}"
    Project = "my project"
  }
}


