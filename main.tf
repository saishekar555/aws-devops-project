resource "aws_instance" "devops_server" {
  ami           = "ami-04a64102b8022e4f3"
  instance_type = var.instance_type

  key_name = "devops-key.pem"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = file("user-data.sh")

  tags = {
    Name = var.instance_name
  }
}