Sidekiq::Cron::Job.destroy_all!
job = Sidekiq::Cron::Job.new( name: 'Hard worker - every min', cron: '* * * * *', klass: 'SiteMapWorker')

if job.valid?
  job.save
  puts "valid"
else
  puts job.errors
end
