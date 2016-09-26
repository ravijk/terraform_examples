output "address" {
  value = "${aws_elb.terraform-poc-elb.dns_name}"
}

output "nat-ip" {
  value = "${aws_instance.terraform-poc-nat.public_ip}"
}