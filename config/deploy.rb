set :application, "hcirack"
set :app, "sinatra_base"
set :domain, 'hciapps.com'
set :deploy_to, "/var/www/apps/sinatraapps/#{app}"
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"
set :user, "rails"

set :scm, :git
set :ssh_options, { :forward_agent => true }
set :use_sudo, false

role :app, "#{app}"
role :web, "#{app}"
role :db, "#{app}", :primary => true

namespace :deploy do
  task :restart, :roles => :app do
    run "mkdir -p #{release_path}/tmp && #{release_path}/tmp/restart.txt"
  end
end