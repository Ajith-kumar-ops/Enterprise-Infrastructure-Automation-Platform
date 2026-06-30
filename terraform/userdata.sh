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