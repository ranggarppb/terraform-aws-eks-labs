resource "aws_eip" "kubernetes_labs_eip1" {
  provider = aws.module
  
  depends_on = [aws_internet_gateway.kubernetes_labs]

  tags = {
    name = "kubernetes_labs_eip1"
  }
}

resource "aws_eip" "kubernetes_labs_eip2" {
  provider = aws.module
  
  depends_on = [aws_internet_gateway.kubernetes_labs]

  tags = {
    name = "kubernetes_labs_eip2"
  }
}