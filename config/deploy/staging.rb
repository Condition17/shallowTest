set :stage, :staging
set :nginx_server_name, "staging-af0f.89.36.26.172.xip.io"
server "89.36.26.172", user: fetch(:user) , roles: %w{web app db}, primary: true

