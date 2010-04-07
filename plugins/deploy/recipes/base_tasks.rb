namespace :setup do

  desc "Set Permissions on deploy directories"
  task :default, :roles => :app do
    run "chown -R #{user}:#{user} /var/www/#{base_app}/#{app_name}"
    run "chown -R #{user}:#{user} /var/www/#{base_app}/#{app_name}/shared",
    run "chown -R #{user}:#{user} /var/www/#{base_app}/#{app_name}/shared/config",
    run "chown -R #{user}:#{user} /var/www/#{base_app}/#{app_name}/releases"
  end
  
  after "deploy:setup", "base:install_dependencies" 
end

namespace :base do
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
end