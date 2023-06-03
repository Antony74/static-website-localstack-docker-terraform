# Create something to host statically - a React app

FROM node:18.16-alpine3.16 AS buildsite
WORKDIR /app
RUN npx create-react-app static-website
WORKDIR /app/static-website
RUN npm run build

# Create a container based on localstack

FROM localstack/localstack

# Install a few generic and useful command line tools

RUN apt-get install wget -y
RUN apt-get install unzip -y
RUN apt-get install vim -y

# Install terraform

ARG TF_VERSION=1.4.6
RUN wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
RUN unzip terraform_${TF_VERSION}_linux_amd64.zip
RUN mv terraform /usr/local/bin/

# Copy files into our localstack container

COPY --from=buildsite /app/static-website/build /build
COPY infrastructure /infrastructure
WORKDIR /infrastructure

# terraform init

RUN terraform init
