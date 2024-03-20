variable "vpc_id" {
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
