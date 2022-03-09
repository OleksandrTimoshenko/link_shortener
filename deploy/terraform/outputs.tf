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

output "db_host" {
  value = module.rds.db_host
}

output "db_name" {
  value = module.rds.db_name
}

output "db_user" {
  value = module.rds.db_user
}

output "db_password" {
  sensitive = true
  value = module.rds.db_password
}