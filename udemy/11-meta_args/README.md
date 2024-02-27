 
 showing output of sensitive values:
 ```shell
 terraform output -json | jq '.[] .value  | .[] |  [.filename,  .content] | join(": ")'                                                                                        
 ```