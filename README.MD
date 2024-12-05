## Prerequisites
A MongoDB Atlas account
MongoDB Atlas account
An Azure account 
Terraform installed in the runtime environment
.
## Setting up the environment
To set up the environment, we will first generate MongoDB Atlas API access key, and then set up a billing method.
Generate MongoDB Atlas API access keys
After establishing an account on MongoDB Atlas and logging in, the next step is to generate an API key to verify the Terraform MongoDB Atlas Provider. To do this, select the access manager for the organization and create the access key. Follow the mongodb atlas documentation to learn more about 
creating an API key

Copy your private key and public key, then set up the environment variables:
export MONGODB_ATLAS_PUBLIC_KEY="<insert your public key here>"
export MONGODB_ATLAS_PRIVATE_KEY="<insert your private key here>"
Update missing values on the tfvars file.
Setting up a billing method for MongoDB
Login to azure cli on you runtime environment.

## Deploy
Run terraform init, terraform plan and terraform apply 