

namespace :bg do
  task :start do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current" do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec rake bg:work['#{fetch(:bg_pid)}'] > /dev/null 2>&1 &" 
        end
      end
    end


  end

  task :restart  do
    Rake::Task["bg:stop"].invoke
    Rake::Task["bg:start"].invoke
  end

  task :stop do
    on roles(:app) do
      execute "if [ -f #{fetch(:bg_pid)} ]; then kill -s KILL `cat #{fetch(:bg_pid)}`; rm #{fetch(:bg_pid)}; fi"
    end
  end
end
