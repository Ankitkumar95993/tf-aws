
output "instance_public_ip" {
    description = "The public IP address of the EC2 instance"
    value = "aws.instance.nginxserver.public_ip"
}

output "instance_url" {
    description = "The url to access the nginx server"
    value = "http://${aws_instance.nginxserver.public_ip}"
  
}