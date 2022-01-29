variable "userlist" {
    type = map(any)
    default = {
        admin = {
            name = "greenadmin"
            role = "admin"
        }
        engineer = {
            name = "greenengineer"
            role = "ec2_full"
            region = "us-east-1"
        }
        accountant = {
            name = "greenaccountant"
            role = "readonly"
        }
    }
}
