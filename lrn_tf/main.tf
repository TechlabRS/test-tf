resource "null_resource" "stu_marks" {
  for_each = var.stu_marks
  provisioner "local_exec" {
    command = " echo student name --> ${each.key} and ${each.value} "
  }
}

variable "stu_marks" {
  default = {
    name = "ragh"
    s1 = 20
    s2 = 24
    s3 = 23
  }
}
# getting error as plug in issue need to look
