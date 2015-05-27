namespace :bg do
  desc "Run jobs in background"
  task :work, [:pid_file] => [:environment] do |_t, args|
    `echo #{Process.pid} >> #{args[:pid_file]}`
    Rails.logger = ActiveSupport::BufferedLogger.new(Rails.root.join('log/bg-worker.log'))
    while true
      while job = Job.where(:visible => false, :completed_at => nil).reorder(:created_at).first do
        job.perform
      end

      while job = Job.where(:visible => true, :completed_at => nil).reorder(:created_at).first do
        job.perform
      end

      sleep 0.5
    end
  end

end
