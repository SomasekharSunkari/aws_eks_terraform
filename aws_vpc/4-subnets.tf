resource "aws_subnet" "private-zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = local.zone-1
  tags = {
    Name                                = "${local.env}-private-${local.zone-1}"
    "kukubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

  }
}
resource "aws_subnet" "private-zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = local.zone-2
  tags = {
    Name                                = "${local.env}-private-${local.zone-2}"
    "kukubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

  }
}
resource "aws_subnet" "public-zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.64.0/19"
  availability_zone = local.zone-1
  map_public_ip_on_launch = true
  tags = {
    Name                                = "${local.env}-private-${local.zone-1}"
    "kukubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

  }
}
resource "aws_subnet" "public-zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.96.0/19"
  availability_zone = local.zone-2
  map_public_ip_on_launch = true
  tags = {
    Name                                = "${local.env}-private-${local.zone-2}"
    "kukubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${local.env}-${local.eks_name}" = "owned"

  }
}


