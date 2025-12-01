resource "aws_instance" "my_ec2" {
 ami = var.ami_value1
 instance_type = var.instance_type
 subnet_id = aws_subnet.vpc_cidr_ec2_vpc_subnet1.id
 vpc_security_group_ids = [aws_security_group.my_sg.id]
 associate_public_ip_address = true
 user_data_base64 = filebase64("./userdata_ec1.sh")
   key_name = "naveen"

  tags = {
    Name = "My_EC2_Instance"
}
}

resource "aws_instance" "instance" {
  ami = var.ami_value1
  instance_type = var.instance_type
  subnet_id = aws_subnet.vpc_cidr_ec2_vpc_subnet2.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  associate_public_ip_address = true
  user_data_base64 = filebase64("./userdata_ec2.sh")
    key_name = "naveen"
    tags = {
        Name = "My_Second_EC2_Instance"
}
}