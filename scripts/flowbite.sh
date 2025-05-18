#!/bin/bash

expected_dir="flowbite_test"
current_dir="$(basename "$PWD")"

if [[ "$current_dir" != "$expected_dir" ]]; then
 echo "Error: This script must be run from the '$expected_dir' directory."
 exit 1
fi

mkdir vendor/assets
mkdir vendor/assets/stylesheets
curl https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.5.2/flowbite.turbo.min.js > vendor/javascript/flowbite.turbo.min.js
curl https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.5.2/flowbite.min.css > vendor/assets/stylesheets/flowbite.css

