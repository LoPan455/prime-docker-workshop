Docker workshop
=====

## Docker's elevator pitch:

"Docker is a type of virtualization technology that allows humans or computers to quickly and easily create tiny units of computing power that use only the resources they need to operate."

Another definition:
	
"Docker allows you to package an application with its environment and all of its dependencies into a "box", called a container. Usually, a container consists of an application running in a stripped-to-basics version of a Linux operating system. An image is the blueprint for a container, a container is a running instance of an image."
	
From https://docker-curriculum.com/:
	
"Docker is a tool that allows developers, sys-admins etc. to easily deploy their applications in a sandbox (called containers) to run on the host operating system i.e. Linux. The key benefit of Docker is that it allows users to package an application with all of its dependencies into a ***standardized unit for software development***. Unlike virtual machines, containers do not have high overhead and hence enable more efficient usage of the underlying system and resources."

* What is virtualization?
* What is a virtual machine?
* What is a container
* Is a container a virtual machine?
* Slides 5 & 6 on that downloaded slideshow.

Why is this relevant?

  - This gives developers the ability to create predictable environments that are isolated from rest of the applications that might be running on the same host and can be run anywhere that Docker is running.  You can build a docker image of your application on Windows and that very same image will run on Linux, macOS, a Raspberry Pi..basically anything that's running the Docker platform.

## Terminology:

* Docker
* container
* image
* Dockerfile
* orchestration


## Let's Get Started!

 a. Install Docker for Mac
 
 b. Open up your terminal.
 
 c. Let's pull a container! -->
* docker run hello-world
* docker pull busybox
* docker images
* docker run busybox (nothing happened)
* docker run busybox echo "hello from busybox"
* docker ps
* docker ps -a
* docker run -it busybox sh
* docker rm
* docker container prune
* docker rmi

 Summary:
* Images - The blueprints of our application which form the basis of containers. In the demo above, we used the docker pull command to download the busybox image.

* Containers - Created from Docker images and run the actual application. We create a container using docker run which we did using the busybox image that we downloaded. A list of running containers can be seen using the docker ps command.

* Docker Daemon - The background service running on the host that manages building, running and distributing Docker containers. The daemon is the process that runs in the operating system to which clients talk to.
* Docker Client - The command line tool that allows the user to interact with the daemon. More generally, there can be other forms of clients too - such as Kitematic which provide a GUI to the users.

* Docker Hub - A registry of Docker images. You can think of the registry as a directory of all available Docker images. If required, one can host their own Docker registries and can use them for pulling images.


Junior Dev Benefits:
 - Keep different project dependencies totally separated out from each other
 - No need to switch between different node versions between projects
 - No need to use janky `brew unlink/link` commands to switch between versions.
 - Very easy to promote your local dev resources into deployable instructions for Stage and Production.
 - Test new stuff without dirtying up your local machine.


## Technical Workshop & Demo

### Single Container

 	1. Open VSCode
 	2. Install Docker plugin
 	3. Create Dockerfile for the Node/React app
 	4. Build The Dockerfile
 	5. Run the Dockerfile.
 	6. Hit the container with a request.

### Container Orchestration with Docker-Compose!
`https://docs.docker.com/compose/`
1. Switch to docker-compose branch
2. Review what docker-compose.yml file will do...
3. Build / Review the Docker-compose file.

CONGRATULATIONS!  You're a Microservices developer!

## What's next?
* Make some images!!!
* Pull some images!!!
* Play with a new technology:  Redis?  Plex? Mongo?
* VSCode's Docker plugins

##Resources:
* https://docker-curriculum.com/
* https://awesome-docker.netlify.com/
* PacktPub Books
* Udemy
