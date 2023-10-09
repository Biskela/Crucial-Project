#RDS
resource "aws_db_instance" "postgreSQL" {
  allocated_storage    = 10
  engine               = "postgreSQL"
  engine_version       = " 15.3"
  instance_class       = "db.t3.micro"
  username             = "Password"
  password             = "Password"
  parameter_group_name = "default.postgres15"
  skip_final_snapshot  = true
}

# RDS SUBNET GROUP
resource "aws_db_subnet_group" "subnet-group" {
  name       = "postgreSQL"
  subnet_ids = [aws_subnet.Final-proj-Pri-Sub.id, aws_subnet.Final-proj-Pri-Sub-2.id]

  tags = {
    Name = "My DB subnet group"
  }
}



# PostgreSQL SECURITY GROUP

resource "aws_security_group" "postgreSQL-SG" {
  name        = "postgreSQL-sg"
  description = "Allow postgreSQL inbound traffic"
  vpc_id      = aws_vpc.Final-Proj-vpc.id

  ingress {
    description = "TLS from postgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }





  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
