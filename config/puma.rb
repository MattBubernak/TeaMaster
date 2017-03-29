# config/puma.rb

# `shared_dir` is the symlinked `shared/` directory created
# by Capistrano - `/home/deploy/my_app/shared`
File.open("unix://#{shared_dir}/tmp/yolo.txt", "w") {}
# Set up socket location
bind "unix://#{shared_dir}/tmp/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/tmp/pids/puma.pid"
state_path "#{shared_dir}/tmp/pids/puma.state"
activate_control_app
