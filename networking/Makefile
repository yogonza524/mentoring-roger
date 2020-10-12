create-firewall:
	gcloud compute firewall-rules create allow-my-group --network=default --priority=1000 --direction=Ingress --source-ranges=0.0.0.0/0 --allow tcp:8080

template:
	gcloud compute instance-templates create instance-template-test --machine-type=e2-micro --image-project=ubuntu-os-cloud --image=ubuntu-1804-bionic-v20200923 --tags=mentoring,roger --metadata-from-file startup-script=./startup.sh

group:
	gcloud compute instance-groups managed create instance-group-test --zone=southamerica-east1-c --template=instance-template-test --health-check=tcp-health-check-8080 --size=1
	gcloud compute instance-groups managed set-autoscaling instance-group-test --zone=southamerica-east1-c --scale-based-on-cpu --target-cpu-utilization=0.6 --min-num-replicas=1 --max-num-replicas=6 --cool-down-period=60 --mode=on

hc:
	gcloud compute health-checks create tcp tcp-health-check-8080 --port=8080 --region=southamerica-east1
