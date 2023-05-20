variable "myvar" {
  default = ["aws_instance.instance.private_ip"]
}
output "myop" {
  value = var.myvar[0]
}
