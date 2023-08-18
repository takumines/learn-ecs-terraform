resource "aws_route53_zone" "this" {
  name          = "takumines.com"
  force_destroy = false

  tags = {
    Name = "${local.name_prefix}-route53"
  }
}

resource "aws_route53_record" "certificate_validation" {
  for_each = {
    for dvo in aws_acm_certificate.root.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }

  name    = each.value.name
  type    = each.value.type
  zone_id = aws_route53_zone.this.zone_id
  ttl     = 60
  records = [each.value.value]
}

resource "aws_route53_record" "root_a" {
  count = var.enable_alb ? 1 : 0

  name    = aws_route53_zone.this.name
  type    = "A"
  zone_id = aws_route53_zone.this.zone_id
  alias {
    name                   = aws_lb.this[0].dns_name
    zone_id                = aws_lb.this[0].zone_id
    evaluate_target_health = true
  }
}