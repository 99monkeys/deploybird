

namespace :bg do
  task :start do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current" do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec rake bg:work['#{fetch(:bg_pid)}'] &" 
        end
      end
    end


  end

  task :restart => [:stop, :start] do

  end

  task :stop do
    exec "if [ -f #{fetch(:bg_pid)} ]; then kill -QUIT `cat #{fetch(:bg_pid)}`; fi"
  end
end
