output "vpc_id" {
	value = aws_vpc.kubernetes_labs.id
}

output "subnet_public_ids" {
	value = [aws_subnet.kubernetes_labs_public_1.id, aws_subnet.kubernetes_labs_public_2.id]
}

output "subnet_private_ids" {
	value = [aws_subnet.kubernetes_labs_private_1.id, aws_subnet.kubernetes_labs_private_2.id]
}

output "internet_gateway_id" {
	value = aws_internet_gateway.kubernetes_labs.id
}

output "elastic_ip_ids" {
	value = [aws_eip.kubernetes_labs_eip_1.id, aws_eip.kubernetes_labs_eip_2.id]
}

output "nat_gateway_ids" {
	value = [aws_nat_gateway.kubernetes_labs_nat_1.id, aws_nat_gateway.kubernetes_labs_nat_1.id]
}

output "routing_table_public_id" {
	value = aws_route_table.kubernetes_labs_public.id
}

output "routing_table_private_ids" {
	value = [aws_route_table.kubernetes_labs_private_1.id, aws_route_table.kubernetes_labs_private_2.id]
}

output "routing_table_asscotiation_public_ids" {
	value = [aws_route_table_association.kubernetes_labs_public_1.id, aws_route_table_association.kubernetes_labs_public_2.id]
}

output "routing_table_asscotiation_private_ids" {
	value = [aws_route_table_association.kubernetes_labs_private_1.id, aws_route_table_association.kubernetes_labs_private_2.id]
}

output "eks_cluster_id" {
	value = aws_eks_cluster.kubernetes_labs.id
}

output "eks_node_group_id" {
	value = aws_eks_node_group.kubernetes_labs_workers.id
}
