resource "aws_route_table" "route_table_private"{
    vpc_id = aws_vpc.Demo-VPC.id
    route{
        #Directing all traffic to NGW 
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
    }
}

#Associate route table to private subnet 

resource "aws_route_table_association" "rta_private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_table_private.id
}