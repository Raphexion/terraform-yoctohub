## More information

https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean

## Commands

- terraform plan

## Destroy a single resource

terraform destroy -target digitalocean_droplet.foobar

## raphexion.auto.tfvars


```
do_token = "<token>"
pub_key = "/home/....pub"
pvt_key = "/home/...."
ssh_fingerprint = "c5::9f...."
```
