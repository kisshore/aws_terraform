variable "userlist" {
    type = map(any)
    default = {
        admin = {
            name = "henry"
            role = "admin"
        }
        engineer = {
            name = "charile"
            role = "ec2_full"
            region = "us-east-1"
        }
        accountant = {
            name = "jennifer"
            role = "readonly"
        }
    }
}
