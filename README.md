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


##### Cgroup:
> A Cgroup (control group) is a collection of process that are bound to a set of limits or parameters defined via cgroup filesystem. [linux manual page](https://www.man7.org/linux/man-pages/man7/cgroups.7.html)

-> These collections/groups can be herarchical, meaning that each group inherits limits from
its parent group.

    - Cgroups provides:
      - Resource limiting:
        Groups can be set to not exceed a configured memory limit, which also includes the
        file system cache, I/O bandwidth limit, CPU quota limit, CPU set limit, or maximum
        open files.

      - Prioritization:
          Some groups may get a larger share of CPU utilization or disk I/O throughput.

      - Accounting:
          measures a group's resource usage.

      - Control:
          freezing groups of processes, their check pointing and restarting.

Source: [wikipedia](https://en.wikipedia.org/wiki/Cgroup).

For advanced reader [Control
groups](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/cgroups.html).

#### Namespaces:

##### Definition from Wikipedia:
```
    Namespaces are a feature of the linux kernel that partitions kernel resources such
    that one set of processes sees one set of resources such that one set of processes
    sees one set of resources while another set of processes sees a different set of
    resources.
```

> The key feature of namespaces is that they isolate processes from each other, the
> namespaces wraps a global system resources in an abstraction that makes it appear to the
> processes within the namespaces that they have their own isolated instance of the global
> resource.

##### Namespace Kinds:

- Mount (mnt):
Isolate the set of filesystem mount points seen by a group of processes. [more details](https://lwn.net/Articles/531114/).

- Utsname :
Allow a single system to appear to have different host and domain names to different
processes (Using the sethostname() and setdomainname() system calls). [more details](https://lwn.net/Articles/179345/).

- PID:
Provides processes with an independent set of process IDs (PIDs) from other namespaces.
PID namespaces are nested, meaning when a new process is created it will have a PID each
namespace from its current namespace up to the initial PID namespace. [more details](https://lwn.net/Articles/259217/).

- Network:
Provide isolation of the systen resources associated with networking. Thus, each network
namespace has its own networks devices, IP address, IP routing tables, /proc/net
directory, port numbers, and so on. [more details](https://lwn.net/Articles/219794/)

- Inter-process Communication (IPC):
Isolate processes from [SysV](https://en.wikipedia.org/wiki/UNIX_System_V) style
inter-process communication - [sysvipc](https://man7.org/linux/man-pages/man7/svipc.7.html) -

- Control group (cgroup) Namespace:
Control group (cgroup) namespaces are a feature in operating systems that provide a way to organize and manage system resources. With cgroup namespaces, processes within a namespace can be grouped together and have their own independent set of resource limits and controls. This allows for better resource isolation and allocation, ensuring that one group of processes does not impact the performance or stability of other groups.

- Time Namespace:
Time namespaces are a feature introduced in 2018 and implemented in 2020 in some operating systems. They provide a way to isolate time-related information within a namespace. Each time namespace has its own perception of time, including the system clock, timers, and timers created by processes. This allows processes within a time namespace to have their own unique time references, independent of other namespaces. Time namespaces can be useful for testing, debugging, and creating time-sensitive applications.

- Proposed Namespaces:
Proposed namespaces refer to additional namespace concepts that have been suggested or proposed for implementation in operating systems. These namespaces may not be fully developed or integrated into operating systems yet, but they represent potential future additions to enhance isolation and control in various aspects of system resources.

- Syslog Namespace:
The syslog namespace is a specific type of namespace proposed in 2020. It aims to provide a way to isolate system logging information within a namespace. By creating a syslog namespace, processes within that namespace can have their own separate logging system, allowing for better organization, filtering, and control of log messages. This can be particularly useful in multi-tenant environments or situations where different applications or processes require independent logging mechanisms.

###### In short:
```
Namespaces: limits what processes can see (and therefore use). 

Cgroup: limits how much you can use. 
```

#### Docker Architecture:
[source](https://docs.docker.com/get-started/overview/)

> Docker uses a client-server architecture. The Docker client talks to the Docker daemon,
> which does the heavy lifting of building, running, and distributing your Docker
> containers. The Docker client and daemon can run on the same system, or you can connect
> a Docker client to a remote Docker daemon. The Docker client and daemon communicate
> using a REST API, over UNIX sockets or a network interface. Another Docker client is
> Docker Compose, that lets you work with applications consisting of a set of containers.

#### The Docker daemon:

> The docker daemon (dockerd) listens for Docker API requests and manages Docker objects
> such as images, containers, networks, and volumes. A daemon can also communicate with
> other daemons to manage Docker services.

#### The Docker client:

> The Docker client (docker) is the primary way that many Docker users interact with
> Docker. The Docker command uses the Docker API. The Docker client can communicate with
> more than one daemon.

#### The Docker Desktop:

> Docker Desktop is an easy-to-install application that enables you to build and share
> containerized applications and microservices. Docker Desktop includes the Docker daemon
> (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes,
> and Credential Helper.


#### Docker registries:

> A Docker registry stores Docker images. Docker Hub is public registry that anyone can
> use, and Docker looks for images on Docker Hub by default. You can even run your own
> private registry.

#### Docker Compose:

> Docker compose is a tool for defining and running multi-container applications. Compose
> simplifies the control of your entire application stack, making it easy to manage
> services, networks, and volumes in a single, comprehensible YAML configuration file. It
> also has commands for managing the whole lifecycle of you application.[more details](https://docs.docker.com/compose/)

#### Dockerfile:

> Docker can build images automatically by reading the instruction from a Dockerfile. The
> Dockerfile supports the following instructions:

[source](https://docs.docker.com/reference/dockerfile/)

| Instruction | Description |
|-------------|:-----------:|
| ADD | Add local or remote files and directories.|
| ARG | Use build-time variables.|
| CMD | Specify default commands|
| COPY | Copy files and directories (from host).|
| ENTRYPOINT | Specify the first to running process.| 
| ENV | Set environment variables.| 
| EXPOSE | describe ports to listening on.|
| FROM | Create a new build stage from a base image.|
| RUN | Execute build commands.|
| USER | Set user and group ID.|
| WORKDIR | Change working directory.|

#### YAML:

> YAML (Yet Another Markup language)is a data serialization language that allows you to store complex data in a compact
> and readable format. [more details](https://www.educative.io/blog/yaml-tutorial)

##### YAML data blocks:

* Sequence: values listed in a specific order. A sequence starts with a dash and a space.
```yaml
---
items:
    - 1
    - 2
    - 3
```
