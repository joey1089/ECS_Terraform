# --- ECS / networks ---

# VPC for ECS
resource "aws_vpc" "ecs_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "ecs-vpc"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id                  = aws_vpc.ecs_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id                  = aws_vpc.ecs_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-1a"
  }
}
