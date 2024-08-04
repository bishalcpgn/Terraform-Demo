# Define the Subnet resource with the name "main"
resource "aws_subnet" "public_subnet" {
  
  # Specify the VPC ID from the previously defined VPC resource on create_vpc.tf
  vpc_id = aws_vpc.Demo-VPC.id
  
  # Set the CIDR block for the subnet
  cidr_block = var.public_subnet_cidr
  
  #Set the availability zone 
  availability_zone = "us-east-1a"

  # Enable automatic public IP assignment for instances launched in this subnet
  map_public_ip_on_launch = true

  # Add tags to add a Subnet Name for identification 
  tags = {
    Name = "Public-Subnet" 
  }
}
