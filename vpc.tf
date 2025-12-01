resource "aws_vpc" "ec2_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ec2_vpc"
  }
}

resource "aws_subnet" "vpc_cidr_ec2_vpc_subnet1" {
    vpc_id            = aws_vpc.ec2_vpc.id
    cidr_block        = var.ec2_vpc_subnet1
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
  
}

resource "aws_subnet" "vpc_cidr_ec2_vpc_subnet2" {
    vpc_id            = aws_vpc.ec2_vpc.id
    cidr_block        = var.ec2_vpc_subnet2
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_route_table" "my_rt" {
    vpc_id = aws_vpc.ec2_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
     }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.ec2_vpc.id

    tags = {
        Name = "my_internet_gateway"
    }
  
}
resource "aws_route_table_association" "ec2_vpc_subnet1" {
    subnet_id      = aws_subnet.vpc_cidr_ec2_vpc_subnet1.id
    route_table_id = aws_route_table.my_rt.id
}
resource "aws_route_table_association" "ec2_vpc_subnet2" {
    subnet_id      = aws_subnet.vpc_cidr_ec2_vpc_subnet2.id
    route_table_id = aws_route_table.my_rt.id
  
}


resource "aws_security_group" "my_sg" {
  name        = "my_security_group"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.ec2_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "my_security_group"
    }
}