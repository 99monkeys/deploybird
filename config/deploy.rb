# config valid only for current version of Capistrano
lock '3.4.0'


set :application, 'strano'
set :repo_url,    'git@github.com:99monkeys/deploybird.git'
set :deploy_to,   "/opt/strano"
set :bg_pid,      "#{shared_path}/tmp/pids/bg.pid"

set :linked_dirs, %w(tmp)


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :rvm_type,         :system
set :rvm_custom_path,  '/opt/rvm'
set :rvm_ruby_version, '2.1.2'
set :rails_env,        :production

set :linked_files,          ['config/database.yml', 'config/strano.yml', 'db/production.sqlite3']



after 'deploy:publishing', 'unicorn:restart'
after 'deploy:publishing', 'bg:restart'
