variable "ami_id" {
  default = "ami-053b0d53c279acc90"  # Ubuntu 22.04 LTS (64-bit x86) for us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform-key"  # You must create this in AWS EC2 > Key Pairs
}
