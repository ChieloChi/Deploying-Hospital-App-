module "vpc-deployment" {
  source             = "./module-vpc"
  environment        = var.environment
  vpc_cidrblock      = var.vpc_cidrblock
  countsub           = var.countsub
  create_subnet      = var.create_subnet
  create_elastic_ip  = var.create_elastic_ip
}

module "nomad-cluster" {
  source             = "./module-cluster"
  environment        = var.environment
  ami_id             = var.nomad_ami_id
  instance_type      = var.nomad_instance_type
  desired_capacity   = var.nomad_desired_capacity
  max_size           = var.nomad_max_size
  min_size           = var.nomad_min_size
  subnet_ids         = module.vpc-deployment.public_subnet_ids
  vpc_id             = module.vpc-deployment.vpc_id
  key_name           = var.key_name
  kms_key_id         = var.kms_key_id
  kms_key_arn        = var.kms_key_arn
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
