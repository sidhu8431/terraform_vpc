resource "aws_security_group" "main_sg" {
 vpc_id      = var.vpc_id
 description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = merge( 
    var.common_tags,
    var.sg_tags,
    {
    Name = local.sg_name_inbound
  }
  )

}