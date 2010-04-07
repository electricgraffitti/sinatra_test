#========================
#CONFIG
#========================
set :application, "hcirack"
set :deploy_to, "/var/www/iphoneapps/sinatra_base"
set :scm, :git
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"
set :user, "rails"

set :ssh_options, { :forward_agent => true }
set :use_sudo, false
#========================
#ROLES
#========================
role :app, "#{application}"
role :web, "#{application}"
role :db, "#{application}", :primary => true
#========================
#CUSTOM
#========================
namespace :deploy do
  
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
  task :stop, :roles => :app do
  # Do nothing.
  end
  desc "Restart Application"
    task :restart, :roles => :app do
      run "touch #{current_release}/tmp/restart.txt"
    end
end