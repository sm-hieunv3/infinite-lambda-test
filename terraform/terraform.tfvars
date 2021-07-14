region = "ap-southeast-1"
project = "devops"
#####ec2 network ######
vpc_name = "cicd"
cidr = "10.1.0.0/16"
cicd_subnet = "10.1.1.0/24"
db_subnet = "10.1.2.0/24"
#####ec2 instance ######
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwB274GuI75/OWU+RhWsWUtDz7JUM5mAJwFUQZHHZ6a0eKO4JbBsZrtVucgSOBL78MZaHpu5n8kc9DfhCgSZd4ON50t179b6qeCDLXLdfPxAGijXVK9P8OAmfXK+1fKEdGA4t53HWdcn6BcG/rFrm38DM04hTzUll1NPGSTQJ+nyvWkhgfyT79Wwc/Y0UsuYO0+M1ST9MzpQLn5G0TbdEFXaqhcgSmESZSao0tznNLEGXwOvi+zXD9oA/mO3++Vy2kY7jCw7tuSC+XPS9d5vq9ubR4uqneZW2zM1CbWhody+eVxvxkmv2YMtb2gmlj5E4qWbEas4olTQmQ1OQjS7Sn"
/*
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAsAdu+BriO+fzllPkYVrFlLQ8+yVDOZgCcBVEGRx2emtHijuC
WwbGa7VbnIEjgS+/DGWh6buZ/JHPQ34QoEmXeDjedLde/W+qnggy1y3Xz8QBoo11
SvT/DgJn1yvtXyhHRgOLedx1nXJ+gXBv6xa5t/AzNOIU81JZdTTxkk0Cfp8r1pIY
H8k+/VsHP2NFLLmDtPjNUk/TM6UC5+RtE23RBV2qoXIEphEmUmqNLc5zSxBl8Dr4
vs1w/aAP5jt/vlctpGO4wsO7bkgvlz0vXeb6vbm0eLqp3mVtszNQm1oaHcvnlcb8
ZJr9mDLW9oJpY+ROKlmxGrOKJU0JkNTkI0u0pwIDAQABAoIBAGFaKxgSHi6NcJ0i
Fnt1LTK5n8Qx7oTqueZtDHVq1WeM70rW8JgRHimxalIa5Zzr4BgmGS7gLyCNL3if
Pui26ot1wCoCxAkb+dteo2d4FhP0zgatf0IOTwTbdbx9sdDfwNNK4JdrwqxqBubl
XTBCKEI/GMLVikqrr4fv2O5VotyNlhkhd0FG4GurGhO4tqjOUsg7n6aOk/J8Pafc
C7YmBVO4+ktJuFcHlPXuntSiU+oC5cxXeoQWHDKKRLVE+EC/sMGvuKs20f8PbCCH
NzfFq6kf2gnylT0kjgYolcQQ4wE29dQjKT58KXB58EUJwOqZtZFCJi5qzA53VD3x
1jNpi4ECgYEA39bH5yr4RaLIon1jkR4X6mMisP9YL34fp6+S51vMny6w1XmdvX+m
MkzXqMj85yI77lC4lOdnF4UxHztMEKl0cirm+BMWZUgNoEVxkM2FhYvREW2R1Hix
rlQ0fGWyY9f29q9Adwb0RBOauR0fQKUL0wkOugFbN2eBtzr8bIwlYOcCgYEAyVIc
1xoi8VrF4o1GUvNlciTkMCflMb8VPJDQPIHqx/rAQYICkl2+P2xWQ8HaEZeUbZIY
O8TOMgab799zh8MIT6st9HHWMdprC9r+GcsBNrWsWkgS6Ji4TyCRZQotb6RCA+nb
+yigSnClP6ORGPbSqOuETpW9Tqg2wnddwLgr1kECgYAiMhHAAxSCruevyzAWz14f
9J0sJRY3yzDS0UPEDIYqG1vwgO/UL1gYfxzDMFFSjixRsAtC1EcvlK14c/qe4QRl
HKDEbUYSmvtZ7MH4uS0Yxc9etjp9FyMt2rdZ+b9S+X9FGGjkxi8y5zvP498OZSh1
SQDy8ZoZ0LpEX8KIYrCjKQKBgA0zJhLwcsQSaJEfJDJCJS+jvZZutzdYyQKsmAqv
lf5AsaRZ6uM/5D5yUwGkTzECGEhK4O3iTIa5KjZDF2caYYwftCan5BxmrsgbNrfo
OI8mwEM3II5BnSwK/Z17WllMksuA5NyF4GShGCShC91wKYXL02P3q27h1p1PiEUf
jjhBAoGAf0aFLNtDdxyB/r3NQqeexIvmTbuFrD85NfM9f63WDx2oZMF0HfmPEM1j
lG5zIPQPaVgCaCuYG+IrGfqpE7drBiPFWqleVQoxYyzuOLrJskTVyqBkLomaDJfu
DH9b0+tkH3K37MEGIgS4aDcerRe7qysAGTs2oIvtRr6vg1fOQOs=
-----END RSA PRIVATE KEY-----
*/
ami = "ami-0e5182fad1edfaa68"
instance_type = "t2.micro"
###database ###
database_storage = 10
engine_version = "9.6.20"
database_type = "db.t3.small"
database_name = "opsdata"
database_username = "opsadmin"
database_port = "5432"
#### s3 bucket ###
web_domain = "nguyenhieu8790-web"