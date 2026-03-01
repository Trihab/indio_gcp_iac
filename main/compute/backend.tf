terraform {
  backend "gcs" {
    bucket = "tf-states-gcs"
    prefix = "compute"
  }
}