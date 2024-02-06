# Terraform for the absolute beginners

Learning resources for https://www.udemy.com/course/terraform-for-the-absolute-beginners course


#### Conventions

|Filename|Purpose content|
|--|--|
|main.tf| Main configuration containing all resources|
|variables.tf|Variables declaration|
|outputs.tf|Contains outputs from resources|
|provider.tf|Contains provider defintion|


##### Useful commands


```shell

#
terraform validate

#
terraform show

terraform providers

terraform providers mirror $DST_DIR

terraform output

terraform output $VAR_NAME


# Deprecated
# sync changes from all remote objects and updates terraform state
# Only the state file will be modified
terraform refresh


# Safe effech ast the deprecated refresh command, but with the oportunity to review changes to the state
terraform apply -refresh-only


# Create dependency graph in DOT format
terraform graph

# with the graphviz package installed
terraform graph | dot -Tsvg > graph.svg


# format to a canonical format
terraform fmt

```