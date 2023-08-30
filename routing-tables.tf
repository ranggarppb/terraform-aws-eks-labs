resource "aws_route_table" "kubernetes_labs_public" {
  provider = aws.module
  
  vpc_id = aws_vpc.kubernetes_labs.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kubernetes_labs.id
  }

  tags = {
    name = "kubernetes_labs_route_public"
  }
}

resource "aws_route_table" "kubernetes_labs_private_1" {
  provider = aws.module
  
  vpc_id = aws_vpc.kubernetes_labs.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kubernetes_labs_nat1.id
  }

  tags = {
    name = "kubernetes_labs_route_private_1"
  }
}

resource "aws_route_table" "kubernetes_labs_private_2" {
  provider = aws.module
  
  vpc_id = aws_vpc.kubernetes_labs.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kubernetes_labs_nat2.id
  }

  tags = {
    name = "kubernetes_labs_route_private_2"
  }
}