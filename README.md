# DevOps_Assignment
DevOps for Terraform and Ansible
# prerequiste:
1. Install AWS CLI to excute the CLI commands to fetch the AWS user id, region and secret with provididng any sensitive data over the repos
2. Create a User and keep the access key and secret key to make use of them in our step 1

# Explainations: 

main.tf -- > 

## 1. Here we will create all the below components via IAC code
		a. vpc
		b. Subnets
		c. Routing tables 
		d. Internet gateway
		e. Security groups 
		f. creating a VM (jenkins server) 
		g. executing needful commands to start the Jenkins server on default 8080
## 2. Varibles files 
		a. all varibles used on the main.tf has been parametrised to .tfvar file 
## 3. Output File : 
		we have displayed the server ID when we exeute terraform plan or apply for the users
## 4. State file : 
		maintaining the state file on S3 to work with multiple teams in order to fetch the latest changes.
  <img width="609" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/14bb5d8c-a3f9-416e-8445-1d87c415eeb9">

