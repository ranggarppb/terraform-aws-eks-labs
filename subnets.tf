resource "aws_subnet" "kubernetes_labs_public_1" {
  provider = aws.module

  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.0.0/18"

  availability_zone = var.availability_zones[0]

  map_public_ip_on_launch = true

  tags = {
    name                                        = "kubernetes_labs_public_subnet_1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }
}

resource "aws_subnet" "kubernetes_labs_public_2" {
  provider = aws.module

  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.64.0/18"

  availability_zone = var.availability_zones[1]

  map_public_ip_on_launch = true

  tags = {
    name                                        = "kubernetes_labs_public_subnet_2"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }
}

resource "aws_subnet" "kubernetes_labs_private_1" {
  provider = aws.module

  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.128.0/18"

  availability_zone = var.availability_zones[0]

  tags = {
    name                                        = "kubernetes_labs_private_subnet_1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}

resource "aws_subnet" "kubernetes_labs_private_2" {
  provider = aws.module

  vpc_id = aws_vpc.kubernetes_labs.id

  cidr_block = "192.168.192.0/18"

  availability_zone = var.availability_zones[1]

  tags = {
    name                                        = "kubernetes_labs_private_subnet_2"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }
}