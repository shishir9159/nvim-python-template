set allow-duplicate-recipes
set allow-duplicate-variables
# set export
set dotenv-filename := "./.env"
set dotenv-load
set dotenv-override
set dotenv-path := "."
set dotenv-required
set ignore-comments
set no-cd
set lazy
set positional-arguments
set shell := ["nu", "-c"]
set unstable
set windows-powershell := false

##### import variables ######
import? '../sdk-codegen/utils.just'
import? '../test-scripts/*.just'

##### Recipes ######
install-nushell:
    #!/usr/bin/env bash
    # remove pb directories using pattern
    # remove sqlc

[positional-arguments]
init-dev-env project_name:
  if not (".venv" | path exists) {
    uv init "$1" 
  }
  uv venv
  uv add --dev ruff ty
