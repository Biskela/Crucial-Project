# fargate #

# resource "aws_eks_fargate_profile" "sika" {
#   cluster_name           = aws_eks_cluster.sika.name
#   fargate_profile_name   = "sika"
#   pod_execution_role_arn = aws_iam_role.sika.arn
#   subnet_ids             = aws_subnet.sika_pubsub[*].id

#   selector {
#     namespace = "sika"
#   }
# }