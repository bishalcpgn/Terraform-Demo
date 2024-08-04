#Returns information of the resource created on AWS

#Returns public ip address of Web-Server instance 
output "public-ip-address" {
  value = aws_instance.Web-Server.public_ip
}


