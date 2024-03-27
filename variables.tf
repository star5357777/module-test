variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet" {
  type = map(object({
    subnet_cidr = string
    subnet_name = string
    public_ip = bool
    az = string
  }))
}

variable "create_route_table" {
  default = true
}

variable "route_table_name" {
  type = string
  default = null
}

variable "sg_name" {
  type = string
}

variable "sg_tag_name" {
  type = string
}

variable "sg_rule" {
  type = map(object({
    type         = string
    description  = string
    to_port      = number
    from_port    = number
    protocol     = string
    sg_cidr      = optional(string)
    source_sg_id = optional(string)
  }))
}

variable "ami" {
  type = string
}

variable "az" {
  type = string
}

variable "ec2_type" {
  type = string
}

variable "key_name" {
  type = string
}

