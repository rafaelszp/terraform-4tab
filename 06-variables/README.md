## Variables

https://developer.hashicorp.com/terraform/language/values/variables

### Using variables


**Method 1**:

```shell
export TF_VAR_filename="myfile.txt"
```

**Method 2**

```shell
terraform apply -var 'filename=myfile.txt -var content=tralalala'
```

**Method 4**
```shell
terraform apply -var-file variables-file.tfvar
```


**Method 3**
```shell
#Using a terraform.tfvarsfile
tee terraform.tfvars <<EOF
filename="myfile.txt"
content="tralalalaa"
EOF
```
Other automatically loaded:
- terraform.tfvars.json
- *.auto.tfvars
- *.auto.tfvars.json


### Precedence (highest first)

1. `terraform apply -var` 
2. `*.auto.tfvars` in alphabetic order
3. `terraform.tfvars`
4. Environment variables. E: `TF_VAR_`
