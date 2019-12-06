variable "myvar" {
	type = "string"
	default = "hello terraform"
}

variable "mymap" {
	type = map(string)
	default = {
		key = "my value"
		key2 = "my value 2"
	}
}

variable "mylist" {
	type = list
	default = [1, 2, 3]
}

