## Terraform 

### What is terraform ?

- Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure.
- Terraform is an IAC tool, used primarily by DevOps teams to automate various infrastructure tasks.

### Terraform Diagram 

<img width="701" alt="Screenshot 2022-11-18 at 09 39 15" src="https://user-images.githubusercontent.com/115224560/202670807-b46c23e5-97cb-488c-80eb-092ffc4c274d.png">



### How to set up Terraform on Mac ? 

- Open the following link https://developer.hashicorp.com/terraform/downloads?product_intent=terraform and download AMD64 (Binary download for macOS)
- Once downloaded ensure to allow permission to open download
- We now need to move this download into ouR /usr/local/bin FOLDER
    - To do so open a new finder press `SHIFT+COMMAND+G` at the same time to open search bar then look for `/usr/local/bin` and move the downlaoded AMD64 folder into `/usr/local/bin`
- Once that is done run `terraform validate` 
- Add AWS keys `export AWS_acce_KEY= ` `export AWS_SECRET_KEY=""`
- create `main.tf` 
- 





### Useful Terraform Commands: 

- `terraform init` Prepare your working directory for other commands
- `terraform validate` Check whether the configuration is valid
- `terraform plan`: Shows changes 
- `terraform apply`: Create or update infrastructure
- `terraform destroy`: Destroy previously-created infrastructure on Cloud

### Creating a VPC using Terraform 


