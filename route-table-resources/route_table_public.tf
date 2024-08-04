
# Define the Route Table resource with the name "route_table_public"
resource "aws_route_table" "route_table_public" {
  
  # Associate the Route Table with the VPC specified by its ID
  vpc_id = aws_vpc.Demo-VPC.id

  # Define a route in the Route Table

  route {
    # Set the CIDR block to 0.0.0.0/0, which refers to all traffic
    cidr_block = "0.0.0.0/0"

    # Set the gateway to the Internet Gateway ID
    gateway_id = aws_internet_gateway.interet_gateway.id 
  }

  # Add tags to provide name to Route Table for identification
  tags = {
    Name = "Route_Table-My-VPC"  
  }
}


#Associate route table to public subnet 
resource "aws_route_table_association" "rta_public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_public.id
}