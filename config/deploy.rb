# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, 'rsra_rails6_example'
set :deploy_user, 'deploy'

# setup repo details
set :repo_url, 'git@github.com:TalkingQuickly/rdra_rails6_example.git'

# setup rbenv.
set :rbenv_type, :system
set :rbenv_ruby, '3.0.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# setup puma to operate in clustered mode, required for zero downtime deploys
set :puma_preload_app, false
set :puma_init_active_record, true
set :puma_workers, 3

# how many old releases do we want to keep, not much
set :keep_releases, 5

# Directories that should be linked to the shared folder
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# dirs we want symlinking to shared
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

namespace :deploy do
end