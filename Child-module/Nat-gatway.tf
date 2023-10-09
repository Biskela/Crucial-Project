# CREATE NAT GATEWAY
resource "aws_nat_gateway" "Final-proj-Nat-GW" {
  allocation_id = aws_eip.Eip-for-Final-proj-NGW.id
  subnet_id     = aws_subnet.Prod-pub-Sub-1.id  

  tags = {
    Name = "Final-proj-Nat-GW"
  }


}

# NAT ASSOCIATION ROUTE
resource "aws_route" "Final-proj-Pri-Route-Table" {
  route_table_id         = aws_route_table.Final-proj-Pri-Route-Table.id
  nat_gateway_id         = aws_nat_gateway.Final-proj-Nat-GW.id
  destination_cidr_block = "0.0.0.0/0"
}