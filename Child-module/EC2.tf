resource "aws_instance" "server-1" {
  ami                         = "ami-078a289ddf4b09ae0" # us-west-1a
  instance_type               = var.instance-1
  key_name                    = "yyy"
  vpc_security_group_ids      = [aws_security_group.Final-proj-SG.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.Final-proj-Pub-Sub.id
}


resource "aws_instance" "server-2" {
  ami                         = "ami-078a289ddf4b09ae0" # us-west-1b
  instance_type               = var.instance-2
  key_name                    = "yyy"
  vpc_security_group_ids      = [aws_security_group.Final-proj-SG.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.Final-proj-Pub-Sub-2.id
}