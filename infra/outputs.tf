output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "app_url" {
  description = "URL of the deployed application"
  value       = "http://${aws_instance.app_server.public_ip}:${var.app_port}"
}