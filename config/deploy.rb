# config valid only for current version of Capistrano

set :application, 'shallow_test'
set :repo_url, 'git@github.com:Condition17/shallowTest.git'
set :branch, "rails-app"

# Do not change afer this line

set :user, "vlad"
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.4.0'

set :deploy_to, "/srv/apps/#{fetch(:application)}"

set :puma_init_active_record, true
set :log_level, :debug
set :pty, true
set :default_env, { path: "$HOME/.rbenv/shims/:$PATH" }
set :rails_env, "production"
set :ssh_options, { forward_agent: true, port: 22, paranoid: false}

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')


namespace :puma do

  after :nginx_config, :reload_nginx_config do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      sudo :nginx, '-s', 'reload'
    end
  end

end
