# static-website-localstack-docker-terraform

Build and bring up our pair of containers

```
docker-compose build
docker-compose up
```

Get a shell on the container which has terraform

```
docker-compose run terraform --rm
```

And there you can run commands such as 

```
terraform apply -auto-approve
```

Clean up

```
docker-compose down
docker-compose rm
```

