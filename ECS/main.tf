
# Create ECR Repository
resource "aws_ecr_repository" "ecr_repo_4_centos" {
  name = "ecr-repo-4-centos"
  image_tag_mutability = "MUTABLE"
}

# Pulls the image
resource "docker_image" "centos" {
  name = "centos:latest"
}