variable "myvar" {
  default = aws_instance.instance.private_ip
}
output "myop" {
  value = myvar.aws_instance.instance.private_ip
}
