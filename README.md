# newrelic-lambda-layer
A terraform module that returns the most recent lambda layer


# Troubleshooting

## Issue: Provider configuration not present
When removing this `newrelic-lambda-layer` module, you need to declare the provider on the parent to do a successful removal.
This is an edge case where terraform will throw a `Error: Provider configuration not present` if you did not happen to declare the provider on the parent module.