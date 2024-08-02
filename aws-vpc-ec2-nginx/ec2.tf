
resource "aws_instance" "nginxserver"{
    ami="ami-068e0f1a600cd311c"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    associate_public_ip_address = true

    user_data = <<-EOF
              #!/bin/bash
              sudo apt install install nginx -y
              sudo systemctl start nginx
              EOF

    tags={
      Name = "NginxServer"
     }
}