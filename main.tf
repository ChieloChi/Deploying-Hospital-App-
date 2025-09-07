module "vpc-deployment" {
  source             = "./module-vpc"
  environment        = var.environment
  vpc_cidrblock      = var.vpc_cidrblock
  countsub           = var.countsub
  create_subnet      = var.create_subnet
  create_elastic_ip  = var.create_elastic_ip
}

module "nomad-cluster" {
  source             = "./module-nomad-cluster"
  environment        = var.environment
  ami_id             = var.nomad_ami_id
  instance_type      = var.nomad_instance_type
  server_count       = var.nomad_server_count
  subnet_ids         = module.vpc-deployment.public_subnet_ids
  vpc_id             = module.vpc-deployment.vpc_id
  key_name           = var.key_name
  public_key_path    = var.public_key_path
  aws_region         = var.aws_region
}

module "vault" {
  source         = "./module-vault"
  ami_id         = var.vault_ami_id
  instance_type  = var.vault_instance_type
  subnet_id      = module.vpc-deployment.private_subnet_db_ids[0]  # or whichever subnet you prefer
  vpc_id         = module.vpc-deployment.vpc_id
  key_name       = var.key_name
  environment    = var.environment
  aws_region     = var.aws_region
  kms_key_id     = var.kms_key_id
  kms_key_arn    = var.kms_key_arn
}

provider "nomad" {
  address = var.nomad_address
}



module "nomad-client-asg" {
  source            = "./module-nomad-client-asg"
  ami_id            = var.nomad_client_ami_id
  subnet_ids        = module.vpc-deployment.public_subnet_ids
  vpc_id            = module.vpc-deployment.vpc_id

  # Optional overrides (only include if you want to customize)
  instance_type     = var.nomad_client_instance_type
  desired_capacity  = var.nomad_client_desired_capacity
  max_size          = var.nomad_client_max_size
  min_size          = var.nomad_client_min_size
  environment       = var.environment
}

module "consul" {
  source         = "./module-consul"
  ami_id         = var.consul_ami_id
  subnet_id      = module.vpc-deployment.public_subnet_ids[0]  # or private if preferred
  vpc_id         = module.vpc-deployment.vpc_id
  key_name       = var.key_name
  environment    = var.environment

  # Optional override
  instance_type  = var.consul_instance_type
}



module "rds-mysql-deployment" {
  source                  = "./module-database"
  environment             = var.environment
  db_instance_class       = var.db_instance_class
  db_allocated_storage    = var.db_allocated_storage
  private_subnet_db_ids   = module.vpc-deployment.private_subnet_db_ids
  db_name                 = var.db_name
  db_password             = var.db_password
  db_username             = var.db_username
  aws_security_group_ids  = module.vpc-deployment.aws_security_group_ids
}
