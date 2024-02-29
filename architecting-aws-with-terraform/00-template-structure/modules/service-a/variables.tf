
# numeric variables must include units
variable "ram_size_gb" {
  type = number
}

variable "enable_external_access" {
  type = bool  
}

# Use count for conditional values
variable "pets_un" {
  type = number
  default =  0
}


#Expose Tags as a variable
variable "tags" {
  default = {}
  type        = "map"
}

variable "region" {
  type = string
  nullable = false
}