#!/bin/bash
set -e

# Ensure bundler is installed
if ! command -v bundle >/dev/null 2>&1; then
  echo "Bundler not found. Installing bundler..."
  gem install bundler
fi

echo "Installing Ruby dependencies with bundler..."
if [ ! -f Gemfile.lock ]; then
  bundle install
else
  bundle check || bundle install
fi

echo "Running update.rb..."
bundle exec ruby update.rb

echo "Running update_tfproviderdocs.rb..."
bundle exec ruby update_tfproviderdocs.rb

echo "All update scripts completed successfully."
