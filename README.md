# aws_terraform

### How to create users with respective policies using terraform.

#### 1. Install dependent packages.
```
#sudo yum install -y yum-utils;yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo; sudo yum -y install terraform git vim;sudo yum install https://prerelease.keybase.io/keybase_amd64.rpm -y
```

#### 2. Clone the repo 
```
# git clone https://github.com/kisshore/aws_terraform.git
```

#### 3. Change the values in main.tf & variables.tf
```
# vim main.tf    -- Enter valid credentials
# vim variables.tf    -- Enter respective user name & engineer's region
```

#### 4. Run terraform commands.
```
# terraform init
# terraform plan
# terraform apply --auto-approve
```

#### 5. Validate in console.
Check if users are created with respecive policies in https://console.aws.amazon.com/iamv2/home#/users
