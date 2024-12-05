
# Create a Project
resource "mongodbatlas_project" "atlas-project" {
  org_id = var.atlas_org_id
  name = var.atlas_project_name
}

# Create a Database User
resource "mongodbatlas_database_user" "db-user" {
  username = "user-1"
  password = random_password.db-user-password.result
  project_id = mongodbatlas_project.atlas-project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = "${var.atlas_project_name}-db"
  }
}

# Create a Database Password
resource "random_password" "db-user-password" {
  length = 16
  special = true
  override_special = "_%@"
}

# # Create Database IP Access List 
# resource "mongodbatlas_project_ip_access_list" "ip" {
#   project_id = mongodbatlas_project.atlas-project.id
#   ip_address = var.ip_address
# }

# Create an Atlas Advanced Cluster 
resource "mongodbatlas_cluster" "test" {
  project_id   = mongodbatlas_project.atlas-project.id
  name         = "${var.atlas_project_name}-${var.environment}-cluster"
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.atlas_region
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  cloud_backup     = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "7.0"

  # Provider Settings "block"
  provider_name               = var.cloud_provider
  provider_disk_type_name     = "P6"
  provider_instance_size_name = var.cluster_instance_size_name
}


output "cluster_name" {
  value = mongodbatlas_cluster.test.name
  description = "Name of the MongoDB Atlas cluster"
}

output "cluster_uri" {
  value = "mongodb://user-1:${random_password.db-user-password.result}@${mongodbatlas_cluster.test.name}.mongodb.net:27017/?authSource=admin&replicaSet=test-replicaSet"
  description = "Connection URI for the MongoDB Atlas cluster"
  sensitive = true
}

output "project_id" {
  value = mongodbatlas_cluster.test.project_id
  description = "ID of the MongoDB Atlas project where the cluster resides"
}