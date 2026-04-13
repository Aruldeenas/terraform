provider "aws" {
    region = "us-east-1"
}
resource "tls_private_key" "deena_key" {
    algorithm = "RSA"
    rsa_bits = 2048
}
resource "aws_key_pair" "deena_key"{
    key_name = "nirmal_key_pair"
    public_key = tls_private_key.deena_key.public_key_openssh
}
resource "local_file" "private_key"{
    content = tls_private_key.deena_key.private_key_pem
    filename = "/home/deena/deena_key.pem"
}
