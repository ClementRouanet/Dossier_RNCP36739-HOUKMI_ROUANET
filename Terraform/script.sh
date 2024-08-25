# Update package index
sudo apt-get update

# Install Docker
echo ${var.password} | sudo -S apt-get install -y docker.io

# Install Git
echo ${var.password} | sudo -S apt-get install -y git

# Install Python and pip
echo ${var.password} | sudo -S apt-get install -y python3 python3-pip

# Install Flask
echo ${var.password} | sudo -S pip3 install flask

# Install Apache
echo ${var.password} | sudo -S apt-get install -y apache2

# Vérification de l'installation de Docker
if command -v docker > /dev/null 2>&1; then
    echo "Docker est installé avec succès."
else
    echo "Erreur: Docker n'est pas installé."
fi

# Vérification de l'installation de Git
if command -v git > /dev/null 2>&1; then
    echo "Git est installé avec succès."
else
    echo "Erreur: Git n'est pas installé."
fi

# Vérification de l'installation de Python
if command -v python3 > /dev/null 2>&1; then
    echo "Python est installé avec succès."
else
    echo "Erreur: Python n'est pas installé."
fi

# Vérification de l'installation de Flask
if pip3 show flask > /dev/null 2>&1; then
    echo "Flask est installé avec succès."
else
    echo "Erreur: Flask n'est pas installé."
fi

# Vérifier si Apache est installé
if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
  echo "Erreur: Apache2 n'est pas installé."
else
  echo "Apache2 est installé avec succès."
fi