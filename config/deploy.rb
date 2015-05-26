# config valid only for current version of Capistrano
lock '3.4.0'


set :application, 'strano'
set :repo_url,    'git@github.com:99monkeys/deploybird.git'
set :deploy_to,   "/opt/strano"

set :linked_dirs, %w(tmp)


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :rvm_type,         :system
set :rvm_custom_path,  '/opt/rvm'
set :rvm_ruby_version, '2.1.2'
set :rails_env,        :production

set :linked_files,          ['config/database.yml', 'config/strano.yml']



namespace :deploy do
  task :restart do
    exec "if [ -f #{fetch(:unicorn_pid)} ]; then kill -USR2 `cat #{fetch(:unicorn_pid)}`; else cd #{fetch(:deploy_to)}/current && bundle exec unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rails_env)} -D; fi"
  end
  task :start do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current" do
        execute :bundle, 'exec bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"'
      end
    end
  end
  task :stop do
    exec "if [ -f #{fetch(:unicorn_pid)} ]; then kill -QUIT `cat #{fetch(:unicorn_pid)}`; fi"
  end
end

after 'deploy:publishing', 'unicorn:restart'
