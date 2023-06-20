#INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id     = aws_vpc.main-vpc.id

  tags = {
    Name = "igw"
  }
}

# Public Route Table with Internet Gateway
resource "aws_route_table" "publicrt" {
  vpc_id     = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "publicrt"
  }
}

# Private Route Table with No Internet Gateway
resource "aws_route_table" "privatert" {
  vpc_id     = aws_vpc.main-vpc.id

  #route {
    #cidr_block = "0.0.0.0/0"
    #gateway_id = aws_internet_gateway.igw.id
  #}

  tags = {
    Name = "privatert"
  }
}

# Public Subnets get assocaited with Public Route Table and Private Subnets with Private Route Table
resource "aws_route_table_association" "zonea-public-subnet-assocation-rt" {
  subnet_id = aws_subnet.zonea-public-subnet.id
  route_table_id = aws_route_table.publicrt.id
}

resource "aws_route_table_association" "zonea-private-subnet-assocation-rt" {
  subnet_id = aws_subnet.zonea-private-subnet.id
  route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "zoneb-public-subnet-assocation-rt" {
  subnet_id = aws_subnet.zoneb-public-subnet.id
  route_table_id = aws_route_table.publicrt.id
}

resource "aws_route_table_association" "zoneb-private-subnet-assocation-rt" {
  subnet_id = aws_subnet.zoneb-private-subnet.id
  route_table_id = aws_route_table.privatert.id
}

resource "aws_route_table_association" "zonec-public-subnet-assocation-rt" {
  subnet_id = aws_subnet.zonec-public-subnet.id
  route_table_id = aws_route_table.publicrt.id
}

resource "aws_route_table_association" "zonec-private-subnet-assocation-rt" {
  subnet_id = aws_subnet.zonec-private-subnet.id
  route_table_id = aws_route_table.privatert.id
}