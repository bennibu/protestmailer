module InvitationsHelper
  def add_recipient_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :recipients, :partial => 'recipient', :locals => {:recipient => ""}
    end
  end
end
