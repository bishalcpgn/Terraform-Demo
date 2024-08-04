# Define the Internet Gateway resource with the name "gw"
resource "aws_internet_gateway" "interet_gateway" {
  
  # Associate the Internet Gateway with the VPC specified by its ID
  vpc_id = aws_vpc.Demo_VPC.id
  
  # Add tags to the provide name to Internet Gateway shown in AWS Console 
  tags = {
    Name = "IGW_MY_VPC"  
  }
}




#Allocate Elastic_IP 
resource "aws_eip" "EIP_NGW" {
    domain   = "vpc" #indicates this EIP is for use in VPC
}

#Define NAT GATEWAY resource 
resource "aws_nat_gateway" "nat_gateway" {

  #Attaching Elastic_IP 
  allocation_id = aws_eip.EIP_NGW.id

  #Attaching NAT GATEWAY in public subnet 
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "NGW"
  }
    
  depends_on = [aws_internet_gateway.interet_gateway] #Traffic of NGW passes through IGW 
}