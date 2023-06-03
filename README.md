
```
docker build --tag=static-website-localstack .
docker run --detach --name=static-website-localstack -p=4566:4566 static-website-localstack
docker exec -it static-website-localstack sh
docker stop static-website-localstack
docker rm static-website-localstack
```
