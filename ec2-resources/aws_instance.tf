

resource "aws_instance" "Web-Server" {
  ami           = var.ami_value
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id 
  vpc_security_group_ids = [ aws_security_group.sg-private.id]
  user_data = base64encode(file("userdata.sh"))


  tags = {
    Name = "WebServer-1"
  }
}