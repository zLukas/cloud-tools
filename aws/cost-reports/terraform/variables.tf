variable "access_key" {
    type = string 
    description = "access_key for aws programaticall access "
    sensitive =true
}

variable "secret_key" {
    type = string 
    description = "secret_key for programaticall access"
    sensitive =true
}

variable "owner" {
    type = string 
    description = "owner of the resources"
}

variable "bucket_name" {
    type = string 
    description = "owner of the resources"
}