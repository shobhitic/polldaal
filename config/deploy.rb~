set :application, "polldaal"
set :user, "shobhit"
set :ip_address, "atulyalabs.com"

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy

set :use_sudo, false

# Git

set :scm, :git
#set :repository,  "#{user}@#{ip_address}:git/#{application}.git"
set :repository,  "git@github.com:shobhitic/#{application}.git"
set :branch, "master"

set :deploy_via, :remote_cache
set :scm_verbose, true
set :use_sudo, false
ssh_options[:forward_agent] = true

# VPS

role :web, "#{ip_address}"
role :app, "#{ip_address}"
role :db,  "#{ip_address}", :primary => true
#role :db,  "208.68.39.157"

# Passenger

namespace :deploy do

  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necesssary prerequisites"

task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end
