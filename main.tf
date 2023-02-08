resource "aws_ecs_cluster" "cluster" {
  name = "example-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "cluster" {
  cluster_name = aws_ecs_cluster.cluster.name

  capacity_providers = ["FARGATE_SPOT", "FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
  }
}
# module "ecs-fargate" {
#   source  = "umotif-public/ecs-fargate/aws"
#   version = "6.7.0"
#   # insert the 7 required variables here
# }

module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "6.7.0"

  name_prefix        = "ecs-fargate-example"
  vpc_id             = aws_vpc.ecs_vpc.id
  private_subnet_ids = [aws_subnet.private_subnet_ecs_1a.id, aws_subnet.private_subnet_ecs_1b.id]

  cluster_id         = aws_ecs_cluster.cluster.id

  task_container_image   = "centos:latest"
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = true

  target_groups = [
    {
      target_group_name = "tg-fargate-ecs"
      container_port    = 80
    }
  ]

  health_check = {
    port = "traffic-port"
    path = "/"
  }

  tags = {
    Environment = "test"
    Project = "Test"
  }
}