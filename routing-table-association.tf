resource "aws_route_table_association" "kubernetes_labs_public_1" {
  provider = aws.module
  
  subnet_id      = aws_subnet.kubernetes_labs_public_1.id
  route_table_id = aws_route_table.kubernetes_labs_public.id
}

resource "aws_route_table_association" "kubernetes_labs_public_2" {
  provider = aws.module
  
  subnet_id      = aws_subnet.kubernetes_labs_public_2.id
  route_table_id = aws_route_table.kubernetes_labs_public.id
}

resource "aws_route_table_association" "kubernetes_labs_private_1" {
  provider = aws.module
  
  subnet_id      = aws_subnet.kubernetes_labs_private_1.id
  route_table_id = aws_route_table.kubernetes_labs_private_1.id
}

resource "aws_route_table_association" "kubernetes_labs_private_2" {
  provider = aws.module
  
  subnet_id      = aws_subnet.kubernetes_labs_private_2.id
  route_table_id = aws_route_table.kubernetes_labs_private_2.id
}