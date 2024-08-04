#User data used in aws_instance.tf 
#!/bin/bash
apt-get update
apt-get install -y apache2
echo "Hello, this is my website" > /var/www/html/index.html

#Start apache on boot  
systemctl enable apache2
systemctl start apache2