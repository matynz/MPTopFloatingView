#!/bin/bash

echo "Starting post clone of app $BUDDYBUILD_APP_ID"

echo "rm  hooks pre push"
rm .git/hooks/pre-push

echo "rake release"
rake release["MPTopFloatingView"]