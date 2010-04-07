#========================
#CONFIG
#========================
set :application, "sinatra_base"
set :scm, :git
set :git_enable_submodules, 1
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :stage, :production
set :user, "rails"
set :use_sudo, false
set :runner, "rails"
set :deploy_to, "/var/www/iphoneapps/#{application}"
set :domain, "hcirack"
#========================
#ROLES
#========================
role :app, domain
role :web, domain
role :db, domain, :primary => true
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