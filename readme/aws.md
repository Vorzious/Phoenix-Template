# Amazon Web Services (AWS)
<!-- TOC -->

  - [Changing AWS Regions](#changing-aws-regions)
  - [Pipelines](#pipelines)

<!-- /TOC -->

## Changing AWS Regions
The file `buildspec.yml` located in the `root` directory refers to the region `eu-west-1`.

```yml
  - eval $(aws ecr get-login --no-include-email --region eu-west-1)
```

To change this replace `eu-west-1` with your preferred region.

## Pipelines
