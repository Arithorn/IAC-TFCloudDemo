variable "instance_type" {
  default = "t3.micro"
}
variable "ami_name" {
    default = ["al2023-*"]
}

variable "ami_owner" {
  default = [ "amazon" ]
}

variable "webserver_count_per_subnet" {
  default = 1
}
variable "applicationserver_count_per_subnet" {
  default = 1
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["af-south-1a", "af-south-1b"]
}

variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public CIDRS"
  default = [ "10.1.1.0/24","10.1.2.0/24" ]
  
}

variable "private_subnet_cidrs" {
  type = list(string)
  description = "Private CIDRS"
  default = [ "10.0.1.0/24","10.0.2.0/24" ]
  
}