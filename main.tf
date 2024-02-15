variable "layer_version" {
  default = "NewRelicNodeJS18X"
}

data "curl" "getLayers" {
  http_method = "GET"
  uri = "https://ap-southeast-2.layers.newrelic-external.com/get-layers"
}

locals {
  layers = jsondecode(data.curl.getLayers.response).Layers
  node_lambda_layer = [for item in local.layers : item if item["LayerName"] == var.layer_version]
}
