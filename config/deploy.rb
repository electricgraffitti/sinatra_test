set :application, "hciapps.com"
set :deploy_to, "/var/www/apps/sinatraapps/#{application}"
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"
set :user, "rails"

set :scm, :git
set :ssh_options, { :forward_agent => true }
set :use_sudo, false

role :app, "#{application}"
role :web, "#{application}"
role :db, "#{application}", :primary => true

namespace :deploy do
  task :restart, :roles => :app do
    run "mkdir -p #{release_path}/tmp && #{release_path}/tmp/restart.txt"
  end
end