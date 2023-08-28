output vpc_id_local {               #terraform provisioned
  value       =  "${aws_vpc.default.id}"
}

output subnet_id_local {              
  value = "${aws_subnet.subnet3-public.id}"
}