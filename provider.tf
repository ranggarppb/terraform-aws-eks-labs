provider "aws" {
  alias  = "module"
  region = var.region
}

data "external" "cluster_ca_certificate" {
  program = ["bash", "./cluster_ca_certificate.sh", aws_eks_cluster.kubernetes_labs.name]
}

provider "kubernetes" {
  host                   = aws_eks_cluster.kubernetes_labs.endpoint
  cluster_ca_certificate = base64decode(data.external.cluster_ca_certificate.result["data"])
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.kubernetes_labs.name]
    command     = "aws"
  }
}
