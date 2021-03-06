# --- root/main.tf ---
module "networking" {
  source           = "./networking"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  public_sn_count  = 2
  private_sn_count = 3
  max_subnets      = 20
  public_cidrs     = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  security_groups  = local.security_groups
  db_subnet_group  = false
}

module "database" {
  source = "./database"
  db_storage = 10 # gibybites
  db_engine_version = "5.7.22"
  db_instance_class = "db.t2.micro"
  dbname = var.dbname
  dbuser = var.dbuser
  dbpassword = var.dbpassword
  db_identifier = "rc-db"
  skip_final_snapshot = true
  db_subnet_group_name = module.networking.db_subnet_group_name[0]
  vpc_security_group_ids = [module.networking.db_security_group]
}