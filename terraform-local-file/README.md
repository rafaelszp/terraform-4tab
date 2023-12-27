# Notes
Terraform flow:

1. init command
2. plan command
3. apply command

3 phases: 

1. Init: Initialization, provider identification
2. Plan.:draft a plan to get to the desired infra
3. Apply: modifies


Destroying:
```shell
 terraform destroy
```

This command will destroy the infrastructure, cleaning the tfstate along the way


#### Convention

|Filename|Purpose content|
|--|--|
|main.tf| Main configuration containing all resources|
|variables.tf|Variables declaration|
|outputs.tf|Contains outputs from resources|
|provider.tf|Contains provider defintion|
