# ------------------------------------------------------------------------------
# Private zone
# ------------------------------------------------------------------------------
resource "aws_route53_zone" "private_zone" {
    name = "${var.environment}.local"

    dynamic "vpc_id" {
        for_each = "vpc_ids"
        content {
            vpc {
                vpc_id = vpc_id.value
            }
        }
    }

    tags = {
        Environment = var.environment
        Service = var.service
        Owner = var.owner
        CreatedBy = var.created_by
        CostCentre = var.cost_centre
        Terraform = "true"
    }
}
