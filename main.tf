terraform {
  required_providers {
    curl = {
      source  = "anschoewe/curl"
      version = "~> 1.0.2"
    }
  }
}

data "curl" "getLayers" {
  http_method = "GET"
  uri = "https://ap-southeast-2.layers.newrelic-external.com/get-layers"
}

locals {
  layers = jsondecode(data.curl.getLayers.response).Layers
  node_lambda_layer = [for item in local.layers : item if item["LayerName"] == "NewRelicNodeJS18X"]
  node_arm_lambda_layer = [for item in local.layers : item if item["LayerName"] == "NewRelicNodeJS18XARM64"]
}