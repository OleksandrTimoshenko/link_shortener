output "IP_adress" {
  value       = module.ec2.public_ip
}


output "public_connection_string" {
  description = "Copy/Paste/Enter - You are in the matrix"
  value       = "ssh -i ${module.ssh-key.key_name}.pem ubuntu@${module.ec2.public_ip}"
}

output "your_domain" {
  description = "New domain name connected to AWS elastis IP"
  value       = module.route53.your_domain
}