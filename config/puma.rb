# config/puma.rb

# `shared_dir` is the symlinked `shared/` directory created
# by Capistrano - `/home/deploy/my_app/shared`
workers 2
threads 1, 6
app_path = File.expand_path("../..", __FILE__)
shared_path = "#{app_path}/shared"
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env
# Set up socket location
bind "unix://#{shared_path}/tmp/sockets/puma.sock"

# Logging
# stdout_redirect "#{shared_path}/log/puma.stdout.log", "#{shared_path}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_path}/tmp/pids/puma.pid"
state_path "#{shared_path}/tmp/pids/puma.state"
activate_control_app
