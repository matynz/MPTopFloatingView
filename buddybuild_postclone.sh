#!/bin/bash

echo "rm  hooks pre push"
rm .git/hooks/pre-push

echo "rake release"
rake release["MPTopFloatingView"]