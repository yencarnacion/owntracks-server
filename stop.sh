gcloud compute --project "propel-gps" firewall-rules delete -q "allow-8083" 
gcloud compute --project "propel-gps" firewall-rules delete -q "allow-1883" 
gcloud compute --project "propel-gps" firewall-rules delete -q "allow-8883" 

gcloud compute instances delete -q propel-owntracks --zone us-central1-b 
