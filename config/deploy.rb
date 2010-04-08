#========================
#CONFIG
#========================
set :user, "rails"
set :base_folder, "iphoneapps"
set :app_name, "sinatra_base"

set :scm, :git
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"

set :deploy_to, "/var/www/#{base_folder}/#{app_name}"

set :ssh_options, { :forward_agent => true }
set :use_sudo, true

set :port, "9191"

server "209.41.75.6", :app, :web, :db, :primary => true

# Callbacks
after "deploy:setup", "base_app:install_dependencies"
after "deploy:setup", "base_app:set_post_deploy_ownership"
after "deploy:cold", "base_app:set_post_deploy_ownership"
after "deploy:cold", "base_app:update_git_permissions"
before "deploy", "base_app:set_pre_deploy_ownership"
after "deploy", "base_app:set_post_deploy_ownership"

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
