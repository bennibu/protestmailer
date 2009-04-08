module InvitationsHelper
  def add_recipient_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :recipients, :partial => 'invitations/recipient', :locals => {:recipient => ""}
    end
  end
end
