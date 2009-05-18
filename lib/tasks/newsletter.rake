desc "Send given newsletter to activists"
task :send_newsletter => :environment do
  newsletter = Newsletter.find(ENV["NEWSLETTER_ID"])

  unless newsletter.send_at
    puts "#{Time.now}: Begin sending newsletter ##{newsletter.id}"
    newsletter.update_attribute(:send_at, Time.now)
    
    for activist in Activist.want_news
      Mailer.deliver_newsletter(newsletter, activist)
    end

    puts "#{Time.now}: Delivering finished."
  end
end