resource "aws_nat_gateway" "kubernetes_labs_nat1" {
  provider = aws.module
  
  allocation_id = aws_eip.kubernetes_labs_nat1.id

  subnet_id = aws_subnet.kubernetes_labs_public_1.id

  tags = {
    name = "kubernetes_labs_nat_1"
  }

}

resource "aws_nat_gateway" "kubernetes_labs_nat2" {
  provider = aws.module
  
  allocation_id = aws_eip.kubernetes_labs_nat2.id

  subnet_id = aws_subnet.kubernetes_labs_public_2.id

  tags = {
    name = "kubernetes_labs_nat_2"
  }

}