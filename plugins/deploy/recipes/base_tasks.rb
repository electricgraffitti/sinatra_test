# Custom Tasks
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

  # Sets permissions
  # We set this after deployment completes.
  task :set_permissions do
    sudo "chown -R #{user}:#{user} #{deploy_to}"
    sudo "chown -R #{user}:#{user} #{deploy_to}/shared"
    sudo "chown -R #{user}:#{user} #{deploy_to}/releases"
  end

end
