# Create something to host statically - a React app

FROM node:18.16-alpine3.16 AS buildsite
WORKDIR /app
RUN npx create-react-app static-website
WORKDIR /app/static-website
RUN npm run build

# Create a container based on localstack

FROM hashicorp/terraform

# Copy files into our localstack container

COPY --from=buildsite /app/static-website/build /build
COPY infrastructure /infrastructure
WORKDIR /infrastructure

# terraform init

RUN terraform init
