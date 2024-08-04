# Define the Internet Gateway resource with the name "gw"
resource "aws_internet_gateway" "interet_gateway" {
  
  # Associate the Internet Gateway with the VPC specified by its ID
  vpc_id = aws_vpc.Demo-VPC.id
  
  # Add tags to the provide name to Internet Gateway shown in AWS Console 
  tags = {
    Name = "IGW-MY-VPC"  
  }
}
