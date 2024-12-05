Before we get started, you will need to have the following accounts/tools set up:
A MongoDB Atlas account — register to get your free 
MongoDB Atlas account
.
An Azure account — register to get your free 
Azure account
.
Terraform — you can follow HashiCorp Terrform’s 
download page
.
Setting up the environment
To set up the environment, we will first generate MongoDB Atlas API access key, and then set up a billing method.
Generate MongoDB Atlas API access keys
After establishing an account on MongoDB Atlas and logging in, the next step is to generate an API key to verify the Terraform MongoDB Atlas Provider. To do this, select the access manager for the organization and create the access key. Follow the documentation to learn more about 
creating an API key
.
Capture where to create an API key(screenshot from the Atlas UI representing the Organization Access Manager section)
Capture where to create an API key (screenshot from the Atlas UI representing the Organization Access Manager section)
Give your API key a clear name that reflects its purpose, like “Terraform Deployment API Key.” Next, we’ll choose the permissions needed for your Terraform tasks. Both Organization Owner and Organization Project Creator roles allow for enough access to complete this, but the Organization Project Creator role should be chosen following the principle of least privilege. To learn more about the user roles, follow the 
Organization Roles and Project Roles
.
Capture for generating an API key* (screenshot from the Atlas UI representing creating API key section)
Capture for generating an API key* (screenshot from the Atlas UI representing creating API key section)
Copy your private key and public key, then set up the environment variables:
export MONGODB_ATLAS_PUBLIC_KEY="<insert your public key here>"
export MONGODB_ATLAS_PRIVATE_KEY="<insert your private key here>"

Capture for adding current IP to Access List Entry (screenshot from the Atlas UI representing adding access list entry section)
Next, we will add an API key access list entry to ensure that API calls originating from IPs or CIDR ranges can give access. We use our current IP address and save.
Setting up a billing method
MongoDB allows a free M0 cluster tier that you do not have to pay for. However, if you want to deploy any other clusters, we will have to set up a billing method. Follow the documentation about setting up a 
billing
 method.