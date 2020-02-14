terraform {
  backend "gcs" {
    credentials = "../credentials.json"
    bucket      = "devops-assignment"
    prefix      = "ahamade/state"
  }
}