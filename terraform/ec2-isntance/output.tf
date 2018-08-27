output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${aws_instance.idwall_desafio.public_dns}"
}
