terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "<= 3.5.1"
    }
    local = {
      source = "hashicorp/local"
      version = "!= 1.4.1, < 2.0.0, > 1.3.0"
    }
    null = {
      source = "hashicorp/null"
      #any build version of this major version eg: 3.1.x - 3.9.x
      version = "~>3.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #ranges accepted is 2.23.0 - 2.23.9
      version = "~>2.23.0"
    }


  }
}

provider "random" {
  # Configuration options
}

provider "local" {}




resource "local_file" "log" {
  # With this approach, if whe remove one item of a list, every item will be recreated
  # so you'd rather use for_each instead of count
  #This resource will be created as a list/tuple
  filename = var.log_filename[count.index]
  content = "[file ${count.index}] - ${random_string.log_string[count.index].result}"
  count = length(var.log_filename)
}

resource "local_file" "log_list" {
  # This object will be created as a map/object
  for_each = toset(var.log_filename)
  filename = "${each.value}.list"
  content = "[file ${each.key}] - ${each.value}"
}

resource "local_file" "log_fileset" {
  # This object will be created as a map/object
  for_each = var.log_set
  filename = each.value
  content = "[file ${each.key}] - ${each.value}"
}

resource "random_string" "log_string" {
  length = 16
  special = false
  lower = true
  count = length(var.log_filename)
}