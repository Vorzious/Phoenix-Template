# {{MODULE_NAME}}
## Table of Contents
<!-- TOC -->

- [{{MODULE_NAME}}](#module_name)
    - [Table of Contents](#table-of-contents)
    - [Local development](#local-development)
        - [First Time](#first-time)
        - [Project Browser](#project-browser)
        - [Docker](#docker)
    - [Production](#production)
    - [YipYip Phoenix Template Umbrella Architecture](#yipyip-phoenix-template-umbrella-architecture)
    - [About YipYip Phoenix Template](#about-yipyip-phoenix-template)
        - [Scaffold](#scaffold)
        - [Versions](#versions)

<!-- /TOC -->

## Local development

### First Time
Fire up Docker

```sh
# Build and run
$ docker-compose up --build

# Create and update the database (after docker-compose up, in a new terminal window)
$ docker exec -it {{APP_NAME}}_dev mix do ecto.create, ecto.migrate

# Seed the database - Dev (after docker-compose up, in a new terminal window)
$ docker exec -it {{APP_NAME}}_dev mix run apps/{{APP_NAME}}/priv/repo/seeds_dev.exs
```

### Project Browser

```sh
#web
localhost:4000

#cms
localhost:4000/cms

#api
localhost:4000/api/healthcheck
```

### Docker
Useful commands

```sh
# If you've already built the docker you can run the following command instead.
$ docker-compose run --rm --service-ports {{APP_NAME}} mix phx.server

# Manually update mix dependencies
$ docker exec -it {{APP_NAME}}_dev mix do deps.unlock --all, deps.clean --all, deps.get

# Example for using Phoenix generators
$ docker exec -it {{APP_NAME}}_dev bash -c "cd apps/{{APP_NAME}}_cms && mix phx.gen.html Accounts User users name:string age:integer"  

# mix format
$ docker exec -it {{APP_NAME}}_dev mix format
```

## Production
```sh
# Seed the database - Live (after docker-compose up, in a new terminal window)
$ docker exec -it {{APP_NAME}}_dev mix run apps/{{APP_NAME}}/priv/repo/seeds.exs
```

----------
## YipYip Phoenix Template Umbrella Architecture
The YipYip Phoenix Template makes use of the umbrella architecture. When using this template you will be receiving the applications `Central`, `API`, `CMS`, `Endpoint` and `Web`, unless you have removed one using the `remove` command from `mix yy.scaffold`. Together these applications will be your entire project.

### Central
`Central` will be where you will keep your schemas, migrations and seeds for all of your applications. You can find this umbrella application at `{{APP_NAME}}_umbrella/apps/{{APP_NAME}}`.

### API
`API` is used for your API needs. Expecting and sending data as json rather than html for the best results. You can find this application at `{{APP_NAME}}_umbrella/apps/{{AP_NAME}}_api`.

### CMS
`CMS` stands for "Content Management System". This will be your main administrator portal where you can manage and maintain all of your data. The CMS will contain a custom design so you can immediately make us of it. You can find this application at `{{APP_NAME}}_umbrella/apps/{{APP_NAME}}_cms`.

### Endpoint
`Endpoint` is the central endpoint for all of your applications. Rather than having an endpoint for each umbrella application which is what Phoenix normally does you will have one shared endpoint that every umbrella application goes through. You can find this application at `{{APP_NAME}}_umbrella/apps/{{APP_NAME}}_endpoint`.

### Web
`Web` is the application meant for your regular users. As every project is unique this application has no design prepared and is ready for your custom use case. You can find this application at `{{APP_NAME}}_umbrella/apps/{{APP_NAME}}_web`.

----------

## About YipYip Phoenix Template
In order to get the full use out of this template make sure to look at and install YipYip Scaffolding.

### Scaffold
This template is used by ```YipYip Scaffold```.

[https://github.com/weareyipyip/YipYip-Phoenix-Scaffold](https://github.com/weareyipyip/YipYip-Phoenix-Scaffold)

### Versions
| Name | Version |
| - | - |
| YipYip Phoenix Template | 2.0.0 |
| YipYip Scaffold | {{SCAFFOLD_VERSION}} |
| Elixir | ~> 1.6.2 |
