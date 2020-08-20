variable "default-region" {
  description = "AWS Default Region"
}

variable "ami" {
  description = "AMI ID for EC2 instances"
}

variable "ssh-access-ips-ipv4" {
  description = "List of IPv4 for access by SSH"
  type = list(string)
}

variable "ssh-access-ips-ipv6" {
  description = "List of IPv6 for access by SSH"
  type = list(string)
}

variable "web-access-public-ips-ipv4" {
  description = "List of IPv4 for access by HTTP/HTTPS"
  type = list(string)
}

variable "web-access-public-ips-ipv6" {
  description = "List of IPv6 for access by HTTP/HTTPS"
  type = list(string)
}

