#!/bin/bash
apt-get update -y
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to Terraform Ubuntu Site</title>
  <style>
    body {
      background: linear-gradient(to right, #232526, #414345);
      color: #fff;
      font-family: 'Segoe UI', sans-serif;
      text-align: center;
      padding-top: 100px;
    }
    h1 {
      font-size: 3em;
      color: #00ffd5;
    }
    p {
      font-size: 1.5em;
    }
  </style>
</head>
<body>
  <h1>Welcome to Your Ubuntu EC2 Deployed via Terraform!</h1>
  <p>This page is running on NGINX inside Ubuntu on AWS EC2.</p>
</body>
</html>
EOF
