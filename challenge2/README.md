To querry the metadata of an EC2 instance using jq (json querry)

Below is the aws cli command to get the details of an aws instance in json format

aws ec2 --region <aws-region> describe-instances --instance-ids i-XXXXXXXXXX

To query the instance ID:

aws ec2 describe-instances --region XXXXXXXX --instance-ids i-XXXXXXXXXX | jq -r .Reservations | jq -r '.[].Instances[].InstanceId'



To query the privateDNS:

aws ec2 describe-instances --region XXXXXXXX --instance-ids i-XXXXXXXXXX | jq -r .Reservations | jq -r '.[].Instances[].PrivateDnsName'



To query the VPC ID:

aws ec2 describe-instances --region XXXXXXXX --instance-ids i-XXXXXXXXXX | jq -r .Reservations | jq -r '.[].Instances[].VpcId'



Similarly we can query other metadata of the instance

