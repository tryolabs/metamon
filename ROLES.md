#Roles
Customization in Metamon is done via customizing each role (or adding new ones). This document will explain what each role in Metamon provides.

It is recommended that you are clear on what roles in Ansible do and how they interact with each other. The [getting started page](http://www.ansible.com/get-started) is a good place to start.

##Overview
There are several roles involved in setting up a development environment. When modifying roles, as well as assigning roles to machines please note the following:
* Dependencies: there are dependencies in between roles.
* Default variables: sometimes the behaviour of each role may change depending of what variables are set to. In most cases variable names are self explanatory.

Up next is a very short description of all the roles.

##Common
The common role is in charge of running common tasks. This role should be added to all machines. All roles should also depend on this role (directly or indirectly). Tasks run in this role include, but may not be limited to:
* Installing common operating system packages such as compilers.
* Installing Supervisord for running services.

##DBServer
Sets up a PostgreSQL 9.3 server. If you're using services such as Amazon's RDS or running on an SQLite Database you do not need to include this role.

By default, the database listens on `localhost` on port `5432`.

Important variables to take a look at are `settings_postgresql_listen_address` and `settings_postgresql_enable_outside_access`.

##Virtualenv
The purpose of this role is to set up a virtualenv on the machine in which to install python packages.

##Application
This role is in charge of setting up the Django application (or pulling a repo with it), generating the `settings.py` file among others. Most importantly, this role will install the packages the application depends on.

The application role depends on the virtualenv role.

##Gunicorn
This role will install and configure Gunicorn. If this role is not added to a machine then another application server (such as the built-in Django development server) needs to be manually run.

The Gunicorn role depends on the application role.

##Nginx
This role will install and configure Nginx. It should (almost) always be used when Gunicorn is used so that static files may be served.

Nginx depends on the Gunicorn role.

##Testing
The testing role will set up the target machine so that unit tests can be run. It will install extra requirements as well as create a `settings_test.py` file with custom configuration for unit tests.

The testing role depends on the application role.

##Development
The development role installs extra applications to aid development.

The development role depends on the application role.