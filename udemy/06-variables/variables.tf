variable "filename" {
  default = "./out/pets.txt"
}

variable "content" {
  default = "We love pets, or not"
}

variable "prefix" {
  default = "Mrs"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = 2
  type = number
  description = "Len of the pet name"
}

variable "password_change" {
  default = true
  type = bool
}

variable "other" {
  default = "other"
  type = string
  description = "this is an other variable for learning purpose"
}

variable "prefix_list" {
  default = ["Mr", "Mrs.", "Sir", "Lady"]
  type = list
}

variable "available_numbers" {
  type = list(number)
  default = [ 0,1,2,3 ]
}

variable "file-content" {
  type = map 
  default = {
    "st1" = "We"
    "st2" = "love"
    "st3" = "pets"
  }
}

variable "pet_count" {
  type = map(number)
  default = {
    "dogs" = 3
    "cats" = 5
    "parrots" = 130
  }
}

variable "mega_numbers" {
  type = set(number)
  default = [ 22,33,44,55,66,77 ]
}

variable "cat_obj" {
  type = object({
    name = string
    color = string
    food = list(string)
    is_favorite = bool
  })

  default = {
    color = "blue"
    food = [ "grass" ]
    age = 13
    is_favorite = false
    name = "gato de rua"
  }
}

variable "kitty" {
  type = tuple([ string,number,bool ])
  default = [ "cat", 7, false ]
}

