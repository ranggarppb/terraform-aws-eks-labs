resource "aws_vpc" "kubernetes_labs" {
  provider = aws.module

  cidr_block = "192.168.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "main"
  }
}
