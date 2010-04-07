set :application, "sinatra_base"
set :server, "hcirack"
set :domain, 'hciapps.com'
set :deploy_to, "/var/www/iphoneapps/#{application}"
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"
set :user, "rails"

set :scm, :git
set :ssh_options, { :forward_agent => true }
set :use_sudo, true

role :app, "#{server}"
role :web, "#{server}"
role :db, "#{server}", :primary => true

namespace :deploy do
  task :restart, :roles => :app do
    run "mkdir -p #{release_path}/tmp && #{release_path}/tmp/restart.txt"
  end
end