resource "aws_key_pair" "mtc_auth" {
  key_name   = var.key_name
  public_key = file("/mnt/workspace/mtckey.pub")
}

resource "aws_instance" "dev_node" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.mtc_auth.id
  vpc_security_group_ids = var.security_group_id
  subnet_id              = var.subnet_id
  user_data              = file("${path.module}/userdata.tpl")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "${var.node_name}-dev-node"
  }

  # provisioner "local-exec" {
  # command = templatefile("${var.host_os}-ssh-config.tpl", {
  #   hostname = self.public_ip,
  #   user     = "ubuntu",
  # identityfile = "~/.ssh/mtckey" })
  #   interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  # }
}