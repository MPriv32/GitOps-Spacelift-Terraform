output "dev_ip" {
    value = aws_instance.dev_node.public_ip
}

output "connection_script" {
    value = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname = aws_instance.dev_node.public_ip,
      user     = "ubuntu",
    identityfile = "~/.ssh/mtckey" })
}