#!/bin/bash
# Use this for your user data (script from top to bottom)
# Install httpd (Amazon Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Custom HTML content
cat <<EOL > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to EC2</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }
        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
        h1, .fun-fact, p {
            color: #fff;
        }
        .fun-fact, .surprise {
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .fun-fact:hover, .surprise:hover {
            transform: scale(1.05);
        }
        .surprise {
            display: none;
        }
    </style>
</head>
<body>
    <h1>Congratulations! You've just launched your EC2 instance: $(hostname -f)</h1>
    <div class="fun-fact" onclick="showSurprise()">Click for a surprise motivational message!</div>
    <div class="surprise">You're doing amazing! Keep up the good work and you'll master AWS in no time!</div>
    <p>Current Server Time: $(date)</p>

    <script>
        function showSurprise() {
            const surpriseElement = document.querySelector('.surprise');
            const funFactElement = document.querySelector('.fun-fact');
            
            if (surpriseElement.style.display === "none") {
                surpriseElement.style.display = "block";
                funFactElement.style.display = "none";
            } else {
                surpriseElement.style.display = "none";
                funFactElement.style.display = "block";
            }
        }
    </script>
</body>
</html>
EOL
