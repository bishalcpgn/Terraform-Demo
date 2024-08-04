# Define the VPC resource with the name "main"
#This name is for terraform reference. 

resource "aws_vpc" "Demo-VPC" {
  
  # Set the CIDR block for the VPC. This defines the IP address range for the VPC.
  cidr_block = var.vpc_cidr
  
  # Specify the instance tenancy. "default" means instances can be launched on any hardware.
  instance_tenancy = "default"

  # Add tag to set the VPC's name displayed in AWS console  
  tags = {
    Name = "MY-VPC" 
  }
}
