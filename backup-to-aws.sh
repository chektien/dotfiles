# assume ~ dir is pi 
cd /home
sudo tar cvzf pi_home.tar.gz pi
aws s3 cp /home/bopi_home.tar.gz s3://bopi
