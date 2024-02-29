variable "region" {
  type = string
}

variable "ram_size_gb" {
  type = string
}

variable "external_access" {
  type = bool
}

variable "state_backend" {
  type = map(string)
}