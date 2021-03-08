# --- database/main ---

resource "aws_db_instance" "rc_db" {
    allocated_storage       = var.db_storage    #10 GB
    engine                  = "mysql"
    engine_version          = var.db_engine_version # 5.7.2
    instance_class          = var.db_instance_class
    name                    = var.dbname
    username                = var.dbuser
    password                = var.dbpassword
    db_subnet_group_name    = var.db_subnet_group_name
    vpc_security_group_ids  = var.vpc_security_group_ids
    identifier              = var.db_identifier
    skip_final_snapshot     = var.skip_final_snapshot
    tags = {
        Name = "rc-db"
    }
}