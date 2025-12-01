variable "ami_value1" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ecb62995f68bb549"  # Example AMI ID, replace with a valid one for your region
}

variable "instance_type"  {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
  
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ec2_vpc_subnet1" {
    description = "The CIDR block for the subnet 1"
    type        = string
    default     = "10.0.0.0/17"
}

variable "ec2_vpc_subnet2" {
    description = "The CIDR block for the subnet 2"
    type        = string
    default     = "10.0.128.0/17"
}

