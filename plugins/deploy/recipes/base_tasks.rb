
  after "deploy:setup", "base_app:set_post_deploy_ownership"
  after "deploy:setup", "base_app:install_dependencies" 
  after "deploy:cold", "base_app:set_post_deploy_ownership"
  after "deploy:cold", "base_app:update_git_permissions"
  before "deploy", "base_app:set_pre_deploy_ownership"
  after "deploy", "base_app:set_post_deploy_ownership"

# Custom Blackbook Mobile tasks
namespace :base_app do
  
  desc "Install gems for app. May need sudo."
  task :install_dependencies do
    dependencies = {
      "sinatra" => "1.0",
      "dm-core" => "0.10.2",
      "dm-timestamps" => "0.10.2",
      "do-sqlite3" => "0.10.2",
      "sinatra-activerecord" => "0.1.2"
    }

    dependencies.each do |gem_name, version|
      puts "#{gem_name} #{version}"
      system "sudo gem install #{gem_name} --version #{version}"
    end
  end
  
  desc "Updates the permissions on the .git directory so subsequent checkouts can be made."
  task :update_git_permissions do
    sudo "chmod -R 775 #{deploy_to}/shared/cached-copy/.git"
  end

  # Internal task that sets the ownership to the 'deploy' user.
  # This helps avoid permission issues when running subsequent tasks.
  task :set_pre_deploy_ownership do
    sudo "chown -R #{user}:#{user} #{deploy_to}"
  end

  # Internal tasks that sets the ownership to the 'live' user.
  # This is the user account that the application runs as on the server.
  # We set this after deployment completes.
  task :set_post_deploy_ownership do
    sudo "chown -R #{owner}:#{owner} #{deploy_to}"
  end

end
