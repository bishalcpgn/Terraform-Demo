# Define the VPC resource with the name "main" which is for terraform reference. 

resource "aws_vpc" "Demo_VPC" {
  
  # Set the CIDR block for the VPC. This defines the IP address range for the VPC.
  cidr_block = var.vpc_cidr
  
  # Specify the instance tenancy. "default" means instances can be launched on any hardware.
  instance_tenancy = "default"

  # Add tag to set the VPC's name displayed in AWS console  
  tags = {
    Name = "MY_VPC" 
  }
}



##Creating Private Subnet 

# Define the Subnet resource 
resource "aws_subnet" "private_subnet" {
  
  # Specify the VPC ID 
  vpc_id = aws_vpc.Demo_VPC.id
  
  # Set the CIDR block for the subnet
  cidr_block = var.private_subnet_cidr
  
  #Set the availability zone 
  availability_zone = var.availability_zone_private

  # Enable automatic public IP assignment for instances launched in this subnet
  map_public_ip_on_launch = false

  # Add tags to add a Subnet Name for identification 
  tags = {
    Name = "Private_Subnet" 
  }
}


## Creating Public Subnet 

# Define the Subnet resource with the name "main"
resource "aws_subnet" "public_subnet" {
  
  # Specify the VPC ID 
  vpc_id = aws_vpc.Demo_VPC.id
  
  # Set the CIDR block for the subnet
  cidr_block = var.public_subnet_cidr
  
  #Set the availability zone 
  availability_zone = var.availability_zone_public

  # Enable automatic public IP assignment for instances launched in this subnet
  map_public_ip_on_launch = true

  # Add tags to add a Subnet Name for identification 
  tags = {
    Name = "Public_Subnet" 
  }
}



##Route table for public subnet 
# Define the Route Table resource 
resource "aws_route_table" "route_table_public" {

  # Associate the Route Table with the VPC specified by its ID
  vpc_id = aws_vpc.Demo_VPC.id

  # Define a route in the Route Table
  route {
    # Set the CIDR block to 0.0.0.0/0, which refers to all traffic
    cidr_block = "0.0.0.0/0"

    # Set the gateway to the Internet Gateway ID
    gateway_id = aws_internet_gateway.interet_gateway.id 
  }

  # Add tags to provide name to Route Table for identification
  tags = {
    Name = "Route_Table_My_VPC"  
  }
}


#Associate route table to public subnet 
resource "aws_route_table_association" "rta_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_public.id
}


##Route Table for private Subnet 
resource "aws_route_table" "route_table_private"{
    vpc_id = aws_vpc.Demo_VPC.id
    route{
        #Directing all traffic to NGW 
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
}

##Associate route table to private subnet 

resource "aws_route_table_association" "rta_private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_table_private.id
}



