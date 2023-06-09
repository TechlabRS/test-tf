data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "components" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t2.micro"
    }
    mongodb = {
      name          = "mongodb"
      instance_type = "t2.micro"
    }
    catalogue = {
      name          = "catalogue"
      instance_type = "t2.micro"
    }
    redis = {
      name          = "redis"
      instance_type = "t2.micro"
    }
    user = {
      name          = "user"
      instance_type = "t2.micro"
    }
    cart = {
      name          = "cart"
      instance_type = "t2.micro"
    }
    mysql = {
      name          = "mysql"
      instance_type = "t2.micro"
    }
    shipping = {
      name          = "shipping"
      instance_type = "t2.micro"
    }
    rabbitmq = {
      name          = "rabbitmq"
      instance_type = "t2.micro"
    }
    payment = {
      name          = "payment"
      instance_type = "t2.micro"
    }
  }
}

resource "aws_instance" "instance" {
  for_each               = var.components
  ami                    = data.aws_ami.centos.image_id
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }
}


resource "aws_route53_record" "records" {
  for_each               = var.components
  zone_id = "Z016684615KU8Y3P3A8M9"
  name    = "${each.value["name"]}-dev.uknowme.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
