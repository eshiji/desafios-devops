data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "instance" {
  vpc_id      = "${data.aws_vpc.default.id}"

  # Inbound HTTP from the Internet
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      self        = true
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow access from any input IP/range hosts"
  }

  # Inbound HTTP from the Internet
  ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow access from any input IP/range hosts"
  }

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${var.cidrs}"]
      description = "Allow access from any input IP/range hosts"
  }

  egress {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
   }
}

resource "aws_instance" "idwall_desafio" {

  ami                         = "${data.aws_ami.amazon_linux.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.instance.id}"]
  associate_public_ip_address = true

  tags {
    Name = "idwall-desafio-t2-unlimited"
  }
}
