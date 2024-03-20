variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
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
