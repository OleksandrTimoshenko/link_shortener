resource "aws_route53_zone" "aws_zone" {
    name = "feature-testing.link"
}

resource "aws_route53_record" "www" {
    zone_id = aws_route53_zone.aws_zone.id
    name = "links-shortener.feature-testing.link"
    type = "A"
    ttl = "300"
    records = [var.public_ip]
}
