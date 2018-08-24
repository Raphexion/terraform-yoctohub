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

## Find volumes and import

```
curl -X GET -H Content-Type: application/json -H Authorization: Bearer ${DO_TOKEN} https://api.digitalocean.com/v2/volumes?region=nyc1
```

```
terraform import digitalocean_volume.foobar 96e204c5-......-0242ac110c03
```

## .ansible.cfg

[defaults]
host_key_checking = False
