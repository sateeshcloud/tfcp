provider "aws" {
    region = "eu-east-2"
    access_key = "AKIA4HATSKS4XKAPOZHD"
    secret_key = "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"
  
}


resource "aws_s3_bucket" "bbuckse" {
  bucket = "my-tf-devtest-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "test1s" {
  bucket = aws_s3_bucket.bbuckse.id
  acl    = "private"
}

resource "aws_redshift_cluster" "example" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "mydb"
  master_username    = "exampleuser"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  number_of_nodes    =  4
  publicly_accessible = true
  
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = "300"
  records = "18.237.205.70"
}