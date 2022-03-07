module "s3" {
  source     = "./modules/s3"
}

module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source     = "./modules/ec2"
  namespace  = var.namespace
  vpc        = module.networking.vpc
  sg_pub_id  = module.networking.sg_pub_id
  key_name   = module.ssh-key.key_name
}

module "route53" {
  source = "./modules/route53"
  public_ip = module.ec2.public_ip
}