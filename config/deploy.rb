# config valid only for current version of Capistrano

set :user, "vlad"

set :application, 'shallowTest'
set :repo_url, 'git@github.com:Condition17/shallowTest.git'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.4.0'

# Default branch is :master
set :branch, "rails-app"

set :deploy_to, "/home/vlad/#{fetch(:application)}"

set :puma_init_active_record, true
# set :format, :pretty
set :log_level, :debug
set :pty, true
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :rails_env, "production"


set :ssh_options, { forward_agent: true, port: 22, paranoid: false}

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
