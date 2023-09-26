output "node_lambda_layer" {
  value = local.node_lambda_layer[0]["LatestMatchingVersion"]["LayerVersionArn"]
}

output "node_arm_lambda_layer" {
  value = local.node_arm_lambda_layer[0]["LatestMatchingVersion"]["LayerVersionArn"]
}
