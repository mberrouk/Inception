# Inception:
> Summary:  This project is a System Administration related exercise.

## Introduction:
> This project is an integral part of the common core curriculum at 1337/42
school. It is specifically designed to enhance student's knowledge of system
administration by incorporating the use of Docker.
The students will virtualise several Docker images by creating them in their
own personal virtual machines.

## Concepts to discover:
- Understand Docker and Docker compose.
- Use and create Dockerfile and compose file.
- Set up and configure NGINX.
- Set up, use, manage, and configure MariaDB.
- Set up and configure WordPress with PHP-FPM.
- Connect the containers using Docker networks.
- Understand Docker volumes.

## Understand Docker:

#### Intro:
> Docker is an open-source platform that allows you to automate the deployment,
scaling, and management of applications using containerization. Docker provides
the ability to package and run an application in a loosely isolated environment
called a container. The isolation and security lets you run many containers
simultaneously on a given host. Containers are lightweight and contain everything needed
to run the application, so you don't need to rely on what's installed on the host. You can
share containers, and be sure that everyone need to run the app is gets the same
environment.

#### Containers: 

Containers is a standard unit of software that packages up code and all its
dependencies. Multiple containers can run on the same machine and share the OS kernel with
other containers, each running as isolated processes in user space.
Linux Container was the first implementation of containerization technology. It leveraged
the linux cgroups and namespace isolation to create light-weight containers. Containers
don't require the installation of a separate guest operating system. Containers only need
the dependent file system and binaries for their functioning. As result, containers are
lightweight as compared to virtual machines. 
> So containers are only isolated groups of processes running on a single host, which
  fulfill four requirements to be acceptable as such:

- Not negotiable: They have to run on a single host.Two computers cannot run a single
container.
- They are groups of processes.
- They need be isolated.
- They have to fulfill common features.

#### Namespaces &  Cgroups:
1. Cgroups:
> A Cgropus is a collection of process that are bound to a set of limits or parameters defined via cgroup filesystem. [linux manual page](https://www.man7.org/linux/man-pages/man7/cgroups.7.html)

 - Cgroups provides:
  - Resource limiting:

...Groups can be set to not exceed a configured memory limit, which also includes the file system cache, I/O bandwidth limit, CPU quota limit, CPU set limit, or maximum open files.



#### Containers VS Virtual machine:
