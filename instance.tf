provider "aws" {
                	access_key    = ""
                	secret_key    = ""
                	region        = "ap-south-1"
               }

resource "aws_instance" "ERP_VM"{
                	ami            = "ami-0c1a7f89451184c8b"
                	instance_type  = "t2.micro"
                	key_name       = "ERP_KEY"
                	security_groups= ["${aws_security_group.ERP_SG.name}"]
                  

    provisioner "file" {
                  source      = "docker_start.sh"
                  destination = "/tmp/docker_start.sh"
              }
    provisioner "remote-exec" {
                  inline=[
                    "chmod +x /tmp/docker_start.sh",
                    "sudo sh /tmp/docker_start.sh",
                    "curl -s https://raw.githubusercontent.com/sundharsk/odoo-14-docker-compose/master/run.sh | sudo bash -s odoo-14-docker-compose-one 80 20014"
                        ]
                }
    connection {
                    type         = "ssh"
                    user         = "ubuntu"
                    host         = self.public_ip
                    private_key  = file("ERP_KEY.pem")
               }

    tags={
        Name = "ERP_TEST"
    }

}

resource "aws_security_group" "ERP_SG" {
              name        = "Allow_ssh_http"
              description = "Allow ERP inbound traffic"
              vpc_id      = "vpc-bb7daad0"

            egress {
              description = "All Traffic"
              from_port   = 0
              to_port     = 0
              protocol    = "-1"
              cidr_blocks = ["0.0.0.0/0"]
                   } 

            ingress {
              description = "SSH"
              from_port   = 22
              to_port     = 22
              protocol    = "tcp"
              cidr_blocks = ["0.0.0.0/0"]
                    }

            ingress {
              description = "HTTP"
              from_port   = 80
              to_port     = 80
              protocol    = "tcp"
              cidr_blocks = ["0.0.0.0/0"]
                    }
            ingress {
              description = "HTTPS"
              from_port   = 443
              to_port     = 443
              protocol    = "tcp"
              cidr_blocks = ["0.0.0.0/0"]
              }
              tags = {
                  Name = "Allow_ssh_http"
       }
}

output "public_ip"{
  value       = aws_instance.ERP_VM.public_ip
  description = "The Public IP address of the ERP_VM instance."
}

