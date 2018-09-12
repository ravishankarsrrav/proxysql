# proxysql
This repository has a Dockerfile and other configuration file of proxysql container image which automatically configures the MySQL node.

# Proxysql v1.4.10 with automatic configuration of mysql single node.
# Link to Image: https://hub.docker.com/r/ravishankarsr/proxysql/
The image configures automatically by picking arguments from environment variables.
The image can be used to configure proxysql for the single MySQL node.
The image configures the single node to default host group which receives both read and write traffic.

The environment inputs of the image are:-
1. PROXY_ADMIN_PASSWORD = environment variable which set the password of the proxysql admin user [Note: The User name is admin].
2. MYSQL_HOST= environment variable to set the MySQL host to servers list.
3. MYSQL_USER = environment variable to add the MySQL user. [Note: the user must have created in MySQL and host should be set to %.]
4. MYSQL_USER_PASSWORD = environment variable to add the password of MySQL user.


MIT © [Ravishankar S R](mailto:ravishankarsr.rav@gmail.com)
