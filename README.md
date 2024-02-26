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


# showing an specific resource of the state file
terraform state show local_file.file

# List all resources in state
terraform state list


#show state in json format
terraform state pull


##Capturing hash_key with jq
terraform state pull | jq '.resources[] | select (.name == "cars")|.instances[]|.attributes.hash_key'


#rename resources / move to another state file
# After this operation, the tf file must be modified
terraform state mv <resource> <dest>


# used when we need to remove the resource from terraform indicating it's no longer managed 
# After this operation, the tf file must be modified so the resource is removed from there as well
# The resource won't be destroyed, only unmanaged by tf
terraform state rm <ADDRESS>


#Tainting the resource so it can be recreated
# A resource is tainted when a provision fails or manually by the following command:
terraform taint <resource name>


#logging
#Levels: ERROR, WARNING, INFO, DEBUG, TRACE
export TF_LOG=<Log Level>

# Defining a file to store logs
export TF_LOG_PATH=<log path>


# Importing external resources to be managed by tf
# Config files won't be updated, only the state file
terraform import <resource_type>.<resource_name> <attribute>

```