# Region (Ohio - us-east-2)
# AZ - us-east-2a || us-east-2b || us-east-2c
# vpc_id - From vpc.tf

resource "aws_subnet" "zonea-public-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-2a"

  tags = {
    Name = "zonea-public-subnet"
  }
}

resource "aws_subnet" "zonea-private-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-2a"

  tags = {
    Name = "zonea-private-subnet"
  }
}

resource "aws_subnet" "zoneb-public-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.3.0/24"

  availability_zone = "us-east-2b"

  tags = {
    Name = "zoneb-public-subnet"
  }
}

resource "aws_subnet" "zoneb-private-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.4.0/24"

  availability_zone = "us-east-2b"

  tags = {
    Name = "zoneb-private-subnet"
  }
}

resource "aws_subnet" "zonec-public-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.5.0/24"

  availability_zone = "us-east-2c"

  tags = {
    Name = "zonec-public-subnet"
  }
}

resource "aws_subnet" "zonec-private-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.6.0/24"

  availability_zone = "us-east-2c"

  tags = {
    Name = "zonec-private-subnet"
  }
}

