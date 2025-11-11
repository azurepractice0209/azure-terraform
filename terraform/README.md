# Create the bucket to store the tfstatefile in s3 bucket.
RUN BELOW COMMAND IN CLI before terraform commands:- 
aws s3api create-bucket --bucket my-tfstate-ap-south-2 --region ap-south-2 --create-bucket-configuration LocationConstraint=ap-south-2

------------------------------------------------------------------
terraform init					=  initiate the terraform dependencies installed in your localmachine
terraform validate				=  validate the terraform script is it proper or not.
terraform plan 					=  Shows the infra which will be created with this terraform script
terraform apply					=  Apply the terraform code to provision the infrastructure with asking the approval.
terraform apply --auto-approve			=  Apply the terraform code to provision the infrastructure without asking the approval.

terraform destroy				=  destroy the infrastructure which was created with approval
terraform destroy --auto-approve		=  destroy the infrastructure which was created without approval
------------------------------------------------------------------

IMP NOTE:- never change anything in tf.state file, it is automatically managed by terraform
