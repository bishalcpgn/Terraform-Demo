

resource "aws_instance" "Web-Server" {
  ami           = var.ami_value
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_group_id
  user_data = <<-EOF
                  #!/bin/bash
                  apt-get update
                  apt-get install -y apache2
                  echo "Hello, this is my website" > /var/www/html/index.html

                  #Start apache on boot  
                  systemctl enable apache2
                  systemctl start apache2

                EOF
  tags = {
    Name = "WebServer-1"
  }
}