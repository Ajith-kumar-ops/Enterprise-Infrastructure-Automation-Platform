#!/bin/bash

dnf update -y

dnf install nginx -y

systemctl enable nginx
systemctl start nginx

cat <<EOF >/usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Enterprise Platform</title>
</head>
<body style="font-family:Arial;text-align:center;margin-top:60px;">
<h1>Enterprise Infrastructure Automation Platform</h1>

<h2>Application Server</h2>

<p>Provisioned using Terraform</p>

<p>Private EC2 Instance</p>

</body>
</html>
EOF

#!/bin/bash

yum update -y

yum install ruby wget -y

cd /home/ec2-user

wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install

chmod +x ./install

./install auto

systemctl enable codedeploy-agent

systemctl start codedeploy-agent