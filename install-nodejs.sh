# check the arm architecture
uname -m

#get the right file (replace armvxxx)
wget https://nodejs.org/dist/v8.9.0/node-v8.9.0-linux-armv6l.tar.gz

# untar
tar -xzf node-v8.9.0-linux-armv6l.tar.gz

# copy into the right directory
cd node-v6.11.1-linux-armv6l/
sudo cp -R * /usr/local/

# check
node -v
