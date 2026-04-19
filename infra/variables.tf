variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}

variable "my_ip" {
  description = "Your public IP in CIDR format for SSH, e.g. 1.2.3.4/32"
  type        = string
}

variable "docker_image" {
  description = "Docker image to run on the EC2 instance"
  type        = string
}

variable "app_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}