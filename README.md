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

## 5. Screen shots: 

<img width="296" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/8e8d2a8e-dc54-420a-9691-b1c9ce926943">

<img width="310" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/1b90c834-d0ef-4843-84e2-38e1eebaf779">

<img width="446" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/3e3226e6-5274-4e3d-ab98-41121089d329">

<img width="458" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/87b612bc-a91d-42c6-8dcb-484656c4b13e">

<img width="464" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/df0f57f1-555b-483f-907d-8eb50d4a976c">


<img width="468" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/675d8814-c620-408d-84b8-d93e9c25c23f">

<img width="464" alt="image" src="https://github.com/rpasup/DevOps_Assignment/assets/17158135/ff7448a9-e75e-4137-920b-93ba283cca6e">

