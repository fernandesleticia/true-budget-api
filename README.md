# True Budget API 
Provides API for [True Budget App](https://github.com/hhldiniz/true-budget-app)

# Prerequisites
- Ruby 2.7.4
- Rails 6.1.6
- PostgreSQL 12

# Running the app
## Build the image based on the dockerfile
```
$ docker compose build
```

## Build the image based on the dockerfile (without the docker compose)
```
$ docker build .
```

**note: use -t to assign a custom name and tag to the image: -t name:tag**

```
$ docker build -t demo:latest .
```

## Check that your image got created
```
$ docker images
```

## Renaming/Retagging an image
**note: this creates a clone of the image with another name**
```
$ docker tag old_name new name
```
**example: docker tag demo:latest leticia/true-buudget-api**

## Instantiate the container
```
docker compose up
```

## Instantiate the container (without the docker compose)
**use -p flag to specify the host machine port and the container exposed port, so they can comunicate**
```
docker run -p 3000:3000 <IMAGE ID>
```

**use -it to run the container in iteractive mode (the container is then prepared to receive input via the command prompt. You can stop the container with CTRL + C when using the -it flag)**
```
docker run -it <IMAGE ID>
```

**use --name to create a container assigning a name to it.**
```
docker run -it --name container_name_app <IMAGE ID>
```

**use --rm flag to ensure the containers are removed automatically when stopped**

**use -d flag to run the container in detached mode (output printed by the container is not visible, the command prompt / terminal does NOT wait for the container to stop)**
```
docker run -p 3000:3000 -d --name app_name --rm demo:latest
```

**use -v flag to create a containg anding a volume to it**

**pass the path, in the container, to the folder you want to save**

**prepend the volume name to the folder path and use a : to separate the volume name to the folder path**

**This named volume will not be deleted when the container is removed**

**If a new container is create using the same v volume_name:/app/path_to_container_folder, it will have access to the data saved**
```
docker run -p 3000:3000 -d --name app_name --rm -v volume_name:/app/path_to_container_folder demo:latest
```

## Check that the process is running
**note: use -a flag to list all the containers, including the stopped ones**
```
docker ps
```

## List docker volumes
```
docker volume ls
```

## Create the database (run this in another terminal)
```
docker compose run web rake db:create
```

## Stop the container
```
docker compose down
```

## Stop the container (without the docker compose)
```
docker stop <container name>
```
**note: stop does not delete the container, you can still see it with docker ps -a**

## To restart a stopped container
```
docker compose up
```

## To restart a stopped container (without the docker compose)
```
docker start <container name>
```

**note: use -a flag if you need to start in the attached mode**
```
docker start -i -a <container name>
```

**note: use -d flag if you need to start in the detached mode (default)**
```
docker start -i -d <container name>
```

## To rebuild the application
**Note: Changes to the Gemfile or the compose file needs a rebuild**

**Note 2: Some changes require only *docker compose up --build*, but a full rebuild requires a re-run of *docker compose run web bundle install* to sync changes in the Gemfile.lock to the host, followed by *docker compose up --build*.**
```
docker compose up
```

## Delete a container (or multiple containers)
```
docker rm container_name
```

```
docker rm container_name_1 container_name_2
```

## Removes all stopped containers
```
docker container prune
```

## Delete an image and its layers
```
docker rmi <IMAGE ID>
```

## Delete all images that have no tags

```
docker image prune
```

## Delete all images even if they have a tag

```
docker image prune -a
```

## Register an account
**Note: use [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) to generate the password**
```
User.create(username: John Doe, password_digest: BCrypt::Password.create("my password"))
```
```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "leticia@truebudget.com", "password": "12345678" } }' http://localhost:3000/users
```

## Login
**Note: we're using the flag '-i' so the response includes headers (which contains the JWT token)**
```
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "leticia@truebudget.com", "password": "12345678" } }' http://localhost:3000/users/sign_in
```

## Making requests using the auth token returned in the last request response

```
curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjU5OTk1MjAyLCJleHAiOjE2NjEyOTEyMDIsImp0aSI6IjY5NTE4NDE3LWMwOWMtNDRlNy04NmQ2LThhOGRlZWU3ZTQyNSJ9.PEhspmjdWN8NKgrqPuCyipVibMY19ymnx0DbsXyDPro" -H "Content-Type: application/json" -d '{ "group": { "name": "Essencial" } }' http://localhost:3000/groups
```

```
curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjY2MDMxMDU5LCJleHAiOjE2NjYxMTc0NTksImp0aSI6IjZkZDJmODJhLTk1ZGUtNDNiMS1iMGQ5LWRhYjYyYWQ1ZGUzNyJ9.Lw5NVn430eepIBdt6qtNoiXGyTO8q125xJ4SYWnX5o4" -H "Content-Type: application/json" http://localhost:3000/groups/1
```

## Sign out
```
curl -XDELETE -H "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjY2MDMxMDU5LCJleHAiOjE2NjYxMTc0NTksImp0aSI6IjZkZDJmODJhLTk1ZGUtNDNiMS1iMGQ5LWRhYjYyYWQ1ZGUzNyJ9.Lw5NVn430eepIBdt6qtNoiXGyTO8q125xJ4SYWnX5o4" -H "Content-Type: application/json" http://localhost:3000/users/sign_out
```
# Create env files
```
cp "sample.env" ".env"
```

# Bugs and feature requests

If you have an idea or found a problem, [feel free to open a new issue](https://github.com/fernandesleticia/true-budget-api/issues/new).

# Creators

[**Leticia Fernandes**](https://github.com/fernandesleticia)

# Copyright and license

Code released under the [GNU General Public License v3.0](https://github.com/fernandesleticia/true-budget-api/blob/main/LICENSE).
