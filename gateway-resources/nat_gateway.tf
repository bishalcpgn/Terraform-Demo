#Allocate Elastic-IP 
resource "aws_eip" "EIP-NGW" {
    domain   = "vpc" #indicates this EIP is for use in VPC
}

#Define NAT GATEWAY resource 
resource "aws_nat_gateway" "nat-gateway" {

  #Attaching Elastic-IP 
  allocation_id = aws_eip.EIP-NGW.id 

  #Attaching NAT GATEWAY in public subnet 
  subnet_id     = aws_subnet.public_subnet.id 

  tags = {
    Name = "NGW"
  }
    
  depends_on = [aws_internet_gateway.interet_gateway] #Traffic of NGW passes through IGW 
}