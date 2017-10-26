#!/bin/bash

ssh $APP_USER@$APP_HOST <<ENDSSH
  echo "changing dir to ./apps/$APP_NAME"
  cd ./apps/$APP_NAME;
  date >> deploy-log.txt;

  echo "Symlinking static"
  ln -sfn lib/$APP_NAME-$APP_VERSION/priv/static static;

  echo "upgrading app";
  PORT=4000 ./bin/$APP_NAME upgrade $APP_VERSION >> deploy-log.txt

  echo "finished"
ENDSSH
