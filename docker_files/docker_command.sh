#!/bin/bash
cd /application/{{APP_NAME}}_umbrella \
  && mix local.hex --force \
  && mix local.rebar --force \
  && mix clean \
  && mix deps.clean --all \
  && mix deps.get

cd /application/{{APP_NAME}}_umbrella/apps/{{APP_NAME}}_cms/assets \
  && npm install \
  && brunch build

cd /application/{{APP_NAME}}_umbrella/apps/{{APP_NAME}}_web/assets \
  && npm install \
  && brunch build

cd /application/{{APP_NAME}}_umbrella \
  && mix compile \
  && mix {{APP_NAME}}_endpoint.digest default \
  && mix phx.server
