provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source = "./modules/vpc-module"

  vpc_name = "myEnv-vpc"
#   vpc_cidr_block = "172.31.0.0/24"
#   private_subnet_cidr_block = "172.31.0.0/25" #0-127
#   public_subnet_cidr_block = "172.31.0.128/25" #0-127

   vpc_cidr_block = "192.168.0.0/16"
  
   public_subnet_cidr_block-a = "192.168.0.0/18" 
   public_subnet_cidr_block-c = "192.168.64.0/18" 

   private_subnet_cidr_block-a = "192.168.128.0/18" 
   private_subnet_cidr_block-c = "192.168.192.0/18" 
}


module "autoscaling" {
  source = "./modules/autoscalinggroup-module"

#   vpc_name = "myEnv-vpc"
#   vpc_cidr_block = "172.31.0.0/24"
#   private_subnet_cidr_block = "172.31.0.0/25" #0-127
#   public_subnet_cidr_block = "172.31.0.128/25" #0-127

#    vpc_cidr_block = "192.168.0.0/16"
    public_subnet_a_id = module.vpc.public_subnet_a_id
    public_subnet_c_id =  module.vpc.public_subnet_c_id

    private_subnet_a_id =  module.vpc.private_subnet_a_id
    private_subnet_c_id =  module.vpc.private_subnet_c_id
   
    webservers_tg_arn = module.loadbalancing.webservers_tg_arn
#    private_subnet_cidr_block-a = "192.168.128.0/18" 
#    private_subnet_cidr_block-c = "192.168.192.0/18" 
}

module "loadbalancing" {
  source = "./modules/loadbalancing-module"

  vpc_id = module.vpc.vpc_id
  webservers-asg_id=  module.autoscaling.webservers-asg_id
  public_subnet_a_id = module.vpc.public_subnet_a_id
  public_subnet_c_id =  module.vpc.public_subnet_c_id

}



# module "accounting" {
#   source = "../modules/Instances"

#   instance_name_tag = "finance_acconting"
#   instance_ami = "ami-05cd35b907b4ffe77"
#   instance_type = "t3.large"
#   availability_zone = "eu-west-1c"
# }

# output "instance_id" {
#   value = module.accounting.instance_id
# }

# output "instance_public_ip" {
#   value = module.accounting.instance_public_ip
# }

# output "instance_private_ip" {
#   value = module.accounting.instance_private_ip
# }