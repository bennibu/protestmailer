class ProtestController < ApplicationController
  
  skip_before_filter :verify_authenticity_token # Avoid problems with deactivated cookies

  def new
    @protest_mail = ProtestMail.new(
      :activist => Activist.new,
      :subject => APP_CONFIG[:protest_mail]['subject'],
      :body => APP_CONFIG[:protest_mail]['body']
    )
  end

  def create
    @protest_mail = ProtestMail.new(params[:protest_mail])
    if @protest_mail.save
      flash[:notice] = "Protestmail wurde gespeichert aber noch nicht verschickt. Bitte schau in Deinem Postfach nach der Bestätigungsemail."
      Mailer.deliver_verification(@protest_mail)
      # Save sender in the session cookie for tellafriend feature
      session[:invitation] = {
        :sender_name => @protest_mail.activist.name,
        :sender_email => @protest_mail.activist.email
      }
      redirect_to :action => 'verify'
    else
      render :action => 'new'
    end
  end

  def verify
    if params[:token]
      @protest_mail = ProtestMail.find_by_token(params[:token])
      if @protest_mail
        if @protest_mail.send_at.nil?
          @protest_mail.deliver_protest!
          flash[:notice] = "Der Protestbrief wurde versand!"
          redirect_to :action => 'delivered'
        else
          flash[:error] = "Achtung, es wurde schon ein Protestbrief versand."
          redirect_to root_path
        end
      else
        flash[:error] = "Adresse ist ungültig. Bitte erneut versuchen"
        redirect_to protest_path
      end
    else
      @invitation = Invitation.new(session[:invitation] || {})
    end
  end

  def delivered
  end

end
