set :application, "sinatra_base"
set :domain, 'hciapps.com'
set :deploy_to, "/var/www/iphoneapps/#{application}"
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, 'master'
set :user, "rails"
set :scm, :git
set :git_enable_submodules, 1
ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :keep_releases, 2

role :app, "#{domain}"
role :web, "#{domain}"
role :db, "#{domain}", :primary => true

namespace :deploy do
  task :restart, :roles => :app do
    run "mkdir -p #{release_path}/tmp && #{release_path}/tmp/restart.txt"
  end
end