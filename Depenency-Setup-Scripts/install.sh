yes 'AuxYhajskwiX' | sudo passwd ec2-user

yes 'y' | sudo yum groupinstall 'Development Tools'
sudo yum install procps-ng curl file git --skip-broken
yes 'AuxYhajskwiX' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/ec2-user/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install java

sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo yum install -y java-16-amazon-corretto-devel

sudo mkdir /opt/minecraft/
sudo mkdir /opt/minecraft/server/
sudo mv server_1.19.4.jar /opt/minecraft/server/
sudo chown -R ec2-user:ec2-user /opt/minecraft/

cd /opt/minecraft/server/
java -Xmx1024M -Xms1024M -jar server_1.19.4.jar nogui

cd /home/ec2-user
javac MinecraftEulaManager.java
java MinecraftEulaManager -t
cd /opt/minecraft/server/
java -Xmx1024M -Xms1024M -jar server_1.19.4.jar nogui
