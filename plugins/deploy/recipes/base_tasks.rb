class Capistrano::Configuration
  
  # sets up the base directories permissions
  
  def directories
    deploy_to_array = configuration[:deploy_to].split('/')
    deploy_to_array.each_with_index do |dir, index|
      next if index == 0 || index >= (deploy_to_array.size-1)
      file '/'+deploy_to_array[1..index].join('/'), :ensure => :directory
    end
    dirs = [
      "#{configuration[:deploy_to]}",
      "#{configuration[:deploy_to]}/shared",
      "#{configuration[:deploy_to]}/shared/config",
      "#{configuration[:deploy_to]}/releases"
    ]
    dirs.each do |dir|
      file dir,
      :ensure => :directory,
      :owner => configuration[:user],
      :group => configuration[:group] || configuration[:user],
      :mode => '775'
    end
  end

end

namespace :setup do

  desc "Set Permissions on deploy directories"
  task :v_vhost, :roles => :app do
    result = directories
  end
  
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

# namespace :deploy do
# 
#   desc "Set Permissions on deploy directories"
#   task :v_vhost, :roles => :app do
#     
#   end
#   
# end