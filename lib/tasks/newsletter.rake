desc "Send given newsletter to activists"
task :send_newsletter => :environment do
  newsletter = Newsletter.find(ENV["NEWSLETTER_ID"])

  unless newsletter.send_at
    puts "#{Time.now}: Begin sending newsletter ##{newsletter.id}"

    newsletter.update_attribute(:send_at, Time.now)

    # Build html and plain text once to save memory
    content_html = newsletter.content_html
    content_plain = newsletter.content_plain

    container = []
    for activist in Activist.want_news
      unless container.include?(activist.email)	# Skip duplicate entries

        begin
          # Replace variables in text with activists info
          html = newsletter.replace_name(content_html, activist.name)
          plain = newsletter.replace_name(content_plain, activist.name)

          # Deliver mail
          Mailer.deliver_newsletter(newsletter.subject, plain, html, activist.name, activist.email)
        rescue => error
          puts "Error on #{activist.email}: #{error}"
        end

        container << activist.email
      end
    end

    puts "#{Time.now}: Delivering finished."
  end
end
