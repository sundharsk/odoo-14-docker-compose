# odoo-14-docker-compose

Prerequisite for installing Odoo Instance :

	• Docker Engine 
	• Docker Compose 
Quick Odoo14 Installation with one command :

	•  curl -s https://raw.githubusercontent.com/sundharsk/odoo-14-docker-compose/master/run.sh | sudo bash -s odoo-14-docker-compose-one 80 20014
  
Steps to Install Odoo Instance :

	• Make sure you have installed Docker Engine and Docker Compose by typing docker-compose --version
	• Please make sure that docker has right permissions.
	
	$ git clone https://github.com/minhng92/odoo-14-docker-compose
	$ sudo chmod -R 777 addons
	$ sudo chmod -R 777 etc
	$ mkdir -p postgresql
	$ sudo chmod -R 777 postgresql
	
Docker Container Management Commands:
	• To start docker composer :
	docker-compose  up -d    # Tag -d is for to run the instance in detached mode
	• To Stop the Container
	docker-composer down
	• To Restart the container 
	docker-compose restart
	• To kill the container
	docker-composer kill
	• To list the running containers
	docker-compose ps
	• To list the build images 
	docker-compose images

Docker-Composer.yml
	• This is the file which contains all the instructions to create a container ; 
	• Default Instance running port is 10014 if you wish to change the port then you can change as mentioned below
		ports:
 		- "10014:8069" 
	• Here you can find the list of services Odoo & PostgesSQL
	
Addon Folder
	• The addons/ folder contains custom addons. Just put your custom addons if you have any.

Odoo Config file
	• To change Odoo configuration, edit file: etc/odoo.conf.
	• Log file: etc/odoo-server.log
	• Default database password (admin_passwd) is minhng.info, please change it.

	• Once you start running the container then you could able to access the instance over web browser.
		○ URL : <host ip address:port>
  ![Odoo_setup](https://user-images.githubusercontent.com/46772827/131207183-fa2f854b-9430-43c2-aec4-a7618906f6e9.png)



