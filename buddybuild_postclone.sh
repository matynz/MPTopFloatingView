#!/bin/bash

echo "Starting post clone of app $BUDDYBUILD_APP_ID"

if [[  $BUDDYBUILD_APP_ID != "59691bd494aa720001181488" ]]; then
  echo "Skip post clone, not the right app"
  exit 0
fi

echo "rm  hooks pre push"
rm .git/hooks/pre-push

echo "rake release"
rake release["MPTopFloatingView"]