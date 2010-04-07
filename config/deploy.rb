#========================
#CONFIG
#========================
server "hcirack", :app, :web, :db, :primary => true
set :user, "rails"
set :owner, "rails"
set :base_folder, "iphoneapps"
set :app_name, "sinatra_base"

set :scm, :git
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"

set :deploy_to, "/var/www/#{base_folder}/#{app_name}"

set :ssh_options, { :forward_agent => true }
set :use_sudo, false

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
