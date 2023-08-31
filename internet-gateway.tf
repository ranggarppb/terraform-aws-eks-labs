resource "aws_internet_gateway" "kubernetes_labs" {
  provider = aws.module

  vpc_id = aws_vpc.kubernetes_labs.id

  tags = {
    name = "kubernetes_labs"
  }
}