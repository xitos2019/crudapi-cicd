variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "node_count" {
  type = number
}

variable "resource_group_name" {
  type = string
}

variable "cluster_dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type = string
}