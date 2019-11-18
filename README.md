My terminal config for any standard ubuntu 18.04 livekey

First setup root password 
~~~
sudo -i
passwd
~~~

Optional cd to Desktop
~~~
cd to /home/ubuntu/Desktop
~~~

Run setup 

~~~
sudo apt install -y git
git clone https://github.com/dkurukula/setuplive.git
cd setuplive
git checkout term
chmod +x setupubuntu.sh
./setupubuntu.sh
~~~

