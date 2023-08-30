locals {
  map_roles = [
    {
      rolearn  = "arn:aws:iam::${var.aws_user_id}:role/eks-workers"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = [
        "system:bootstrappers",
        "system:nodes"
      ]
    }
  ]
  map_users = [
    {
      userarn  = "arn:aws:iam::${var.aws_user_id}:root"
      username = "root"
      groups = [
        "system:masters"
      ]
    }
  ]
}

resource "kubernetes_config_map" "kubernetes_labs" {
  provider = aws.module
  
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
    labels    = {}
  }

  count = 1

  data = {
    mapRoles = yamlencode(local.map_roles)
    mapUsers = yamlencode(local.map_users)
  }

  depends_on = [aws_eks_cluster.kubernetes_labs]
}

resource "kubernetes_cluster_role" "kubernetes_labs_reader" {
  provider = aws.module
  
  metadata {
    name = "reader"
  }

  rule {
    api_groups = [""]
    resources  = ["deployments", "configmaps", "pods", "secrets", "services"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "kubernetes_labs" {
  provider = aws.module
  
  metadata {
    name = "reader"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "reader"
  }

  subject {
    kind      = "Group"
    name      = "reader"
    api_group = "rbac.authorization.k8s.io"
  }
}
