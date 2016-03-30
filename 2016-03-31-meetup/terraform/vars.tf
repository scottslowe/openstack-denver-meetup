variable "image" {
	default = "Cirros 0.3.4"
}

variable "flavor" {
	default = "m1.small"
}

variable "external_gateway" {
	default = "c924f32c-a583-4b6a-af23-62746790a205"
}

variable "key_pair" {
	default = "lab"
}

variable "pool" {
	default = "ext-net-5"
}
