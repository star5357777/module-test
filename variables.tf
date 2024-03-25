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

variable "nic_info" {
	type = map(object({
		subnet_id = string
		private_ip = string
		sg_id = string
	}))
}

variable "ebs_info" {
	type = map(object({
		az = string
		storage_type = string
		storage_size = number
		storage_name = string
		kms_arn = string
	}))
}

variable "ec2" {
	type = map(object({
		ami            = string
		az             = string
		ec2_type       = string
		key_name       = string
		script         = optional(string, "")
		ec2_name       = string
		os_volume_type = string
		os_volume_size = number
		os_volume_name = string
		encrypted      = bool
		kms_arn        = string
	}))
}

variable "nic_attachment_info" {
	type = map(object({
		ec2_id = string
		nic_id = string
		nic_index = number
	}))
}

variable "ebs_attachment" {
	type = map(object({
		force_detach = bool
		device_name = string
		ebs_id = string
		ec2_id = string
	}))
}
