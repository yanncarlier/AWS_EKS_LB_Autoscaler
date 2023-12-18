
# aws ec2 describe-instance-type-offerings --location-type availability-zone  --filters Name=instance-type,Values=t3.medium --region ap-northeast-2 --output table
# ------------------------------------------------------------
# |               DescribeInstanceTypeOfferings              |
# +----------------------------------------------------------+
# ||                  InstanceTypeOfferings                 ||
# |+--------------+-------------------+---------------------+|
# || InstanceType |     Location      |    LocationType     ||
# |+--------------+-------------------+---------------------+|
# ||  t3.medium   |  ap-northeast-2a  |  availability-zone  ||
# ||  t3.medium   |  ap-northeast-2b  |  availability-zone  ||
# ||  t3.medium   |  ap-northeast-2d  |  availability-zone  ||
# ||  t3.medium   |  ap-northeast-2c  |  availability-zone  ||
# |+--------------+-------------------+---------------------+|


variable "demand_instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "EKS node instances on demand type"
}

variable "spot_instance_types" {
  type        = list(string)
  default     = ["t3.medium", "t2.large", "t3a.medium"]
  description = "EKS node instances spot type"
}

#####################################################

variable "environment" {
  default = "dev"
}

variable "region" {
  default     = "ap-northeast-2"
  description = "AWS region"
}

variable "cluster_name" {
  default     = "cluster2"
  description = "EKS Cluster name"
}

# jumpBox
variable "jumpbox_private_key_path" {
  type    = string
  default = "JumpBox.pem"
}

variable "domain_name" {
  default     = "your_domain_name.com"
  description = "EKS Cluster domain name"
}

# RDS
variable "rds_master_username" {
  default = "root"
}

variable "rds_master_password" {
  default = "Prototype1Password"
}

variable "cluster_version" {
  default     = "1.24"
  description = "Kubernetes version"
}

variable "agent_namespace" {
  default     = "gitlab-agent"
  description = "Kubernetes namespace to install the Agent"
}

# ec2 JumpBox varibles  

variable "rds_username" {
  type    = string
  default = "root"
}

variable "rds_password" {
  type    = string
  default = "Prototype1Password"
}

variable "rds_host" {
  type    = string
  default = "testing.cluster-ro-url-example.test"
}



