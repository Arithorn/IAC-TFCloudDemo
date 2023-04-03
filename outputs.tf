output "ami_id" {
    value = data.aws_ami.aws_linux_ami.id
}

output "webserver_ip_address" {
  value = aws_instance.webservers[*].private_ip
}
output "appserver_ip_address" {
  value = aws_instance.applitcation_servers[*].private_ip
}