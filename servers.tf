resource "aws_instance" "webservers" {
  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = var.instance_type
  count = var.webserver_count_per_subnet * length(aws_subnet.public_subnets)
  subnet_id =  aws_subnet.public_subnets[count.index % length(aws_subnet.public_subnets)].id
  tags = {
    Name = "Web Servers",
    Env = "Lab",
    Owner = "Peet Gouws"
  }
}

resource "aws_instance" "applitcation_servers" {
  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = var.instance_type
  count = var.applicationserver_count_per_subnet * length(aws_subnet.private_subnets)
  subnet_id = aws_subnet.private_subnets[count.index % length(aws_subnet.private_subnets)].id
  tags = {
    Name = "Application",
    Env = "Lab",
    Owner = "Chiraag"
  }
}
