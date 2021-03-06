set :stage, :production
set :branch, "master"

# This is used in the Nginx VirtualHost to specify which domains
# the app should appear on. If you don't yet have DNS setup, you'll
# need to create entries in your local Hosts file for testing.
set :nginx_server_name, 'rdr-rails6-example.staging.talkingquickly.co.uk'

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"


# Name sidekiq systemd service after the app and stage name so that
# multiple apps and stages can co-exist on the same machine if needed
set :sidekiq_service_unit_name, "sidekiq_#{fetch(:full_app_name)}"


server '65.21.54.211', user: 'deploy', roles: %w{web app db}, primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production