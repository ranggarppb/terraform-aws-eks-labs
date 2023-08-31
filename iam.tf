#################################### KUBERNETES CLUSTER IAM ####################################

data "aws_iam_policy_document" "kubernetes_labs_cluster_trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "kubernetes_labs" {
  provider = aws.module

  name = "eks-cluster"

  assume_role_policy = data.aws_iam_policy_document.kubernetes_labs_cluster_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs" {
  provider = aws.module

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  role = aws_iam_role.kubernetes_labs.name
}

#################################### KUBERNETES WORKERS IAM ####################################

data "aws_iam_policy_document" "kubernetes_labs_workers_trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "kubernetes_labs_workers" {
  provider = aws.module

  name = "eks-workers"

  assume_role_policy = data.aws_iam_policy_document.kubernetes_labs_workers_trust_policy.json
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs_workers_general" {
  provider = aws.module

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  role = aws_iam_role.kubernetes_labs_workers.name
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs_workers_cni_policy" {
  provider = aws.module

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  role = aws_iam_role.kubernetes_labs_workers.name
}

resource "aws_iam_role_policy_attachment" "kubernetes_labs_workers_ecr_policy" {
  provider = aws.module

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  role = aws_iam_role.kubernetes_labs_workers.name
}