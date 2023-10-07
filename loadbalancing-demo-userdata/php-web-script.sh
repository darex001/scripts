#!/bin/bash
yum update -y

# Install Apache
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Install PHP
amazon-linux-extras install -y php7.2
systemctl restart httpd

# Create PHP page
cat << 'EOF' > /var/www/html/index.php
<?php
$colors = ['red', 'blue', 'green', 'yellow', 'pink', 'purple', 'orange'];
$randColor = $colors[array_rand($colors)];

$funMessages = [
    "Keep Refreshing! 🔄",
    "Another Instance, Another Adventure! 🚀",
    "Load Balanced! ⚖️",
    "Hey, it's a new server! 🖥️",
    "Spread the Load! ⚡",
    "Scaling to the Clouds! ☁️",
    "Balance is the Key! 🔑"
];
$randMessage = $funMessages[array_rand($funMessages)];
?>

<html>
<head>
    <style>
        body {
            background-color: <?= $randColor ?>;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
            justify-content: center;
            align-items: center;
            transition: background-color 0.5s;
        }
        h1 {
            font-size: 2.5em;
        }
        h2 {
            font-size: 2em;
            margin-top: 20px;
        }
        h3 {
            font-size: 1.5em;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div>
        <h1>Welcome to QuantumCode</h1>
        <h2>Instructor: Michael</h2>
        <h3>Server IP: <?php echo $_SERVER["SERVER_ADDR"]; ?></h3>
        <h3><?= $randMessage ?></h3>
    </div>
</body>
</html>
EOF
