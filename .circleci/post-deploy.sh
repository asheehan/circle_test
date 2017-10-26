#!/bin/bash

ssh $APP_USER@$APP_HOST <<ENDSSH
  echo "changing dir to ./apps/$APP_NAME"
  cd ./apps/$APP_NAME;
  date >> deploy-log.txt;

  echo "Symlinking static"
  ln -sfn lib/$APP_NAME-$APP_VERSION/priv/static static;

  echo "upgrading app";
  ./bin/$APP_NAME stop >> deploy-log.txt
  PORT=4000 ./bin/$APP_NAME start >> deploy-log.txt

  echo "finished"
ENDSSH
