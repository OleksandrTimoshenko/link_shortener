variable "engine" {
  type = string
  default = "postgres"
}

variable "engine_version" {
  type = any
}

variable "db_name" {
  type = string
  default = "postgres"
}

variable "db_user" {
  type = string
  default = "postgres"
}

variable "db_password" {
  sensitive = true
  type = string
}