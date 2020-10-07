provider "aws" {
   region = "ap-south-1"
}

resource "aws_db_instance" "example" {
      identifier_prefix = "terraform-up-and-running"
      engine            = "mysql"
      allocated_storage = 10
      instance_class    = "db.t2.micro"
      name              = "example_database"
      username          = "admin"

      #How should we set the password?
      password = var.db_password
      skip_final_snapshot = true
      }


terraform {
     backend "s3" {
     #Replace this with your bucket name!
     bucket = "terraform-mano-state"
     key = "stage/data-stores/mysql/terraform.tfstate"
     region = "ap-south-1"

     dynamodb_table = "terraform-up-and-running-locks"
     encrypt = true
     }
}
