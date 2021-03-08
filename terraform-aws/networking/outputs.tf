# --- networking/outputs.tf ---

output "vpc_id" {
  value = aws_vpc.rc_vpc.id
}

output "db_subnet_group_name" {
    value = aws_db_subnet_group.rc_rds_subnetgroup.*.name
}

output "db_security_group" {
    value = [aws_security_group.rc_sg["rds"].id]
}