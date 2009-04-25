desc "Send mail with current stats about activity"
task :send_stats => :environment do
  Mailer.deliver_stats
end