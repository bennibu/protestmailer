class ProtestController < ApplicationController
  def index
    redirect_to :action => 'new'
  end

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
      flash[:notice] = "Protestmail wurde gespeichert. Du erhälst nun eine E-Mail mit einem Link zur Bestätitung."
      Mailer.deliver_verification(@protest_mail)
      render :action => 'verify'
    else
      render :action => 'new'
    end
  end

  def verify
    if params[:token]
      @protest_mail = ProtestMail.find_by_token(params[:token])
      if @protest_mail
        if @protest_mail.send_at.nil?
          Mailer.deliver_protest_mail(@protest_mail)
          @protest_mail.update_attribute(:send_at, Time.now)
          flash[:notice] = "Der Protestbrief wurde versand!"
          render :template => 'protest/delivered'
        else
          flash[:error] = "Achtung, es wurde schon ein Protestbrief versand."
          redirect_to root_path
        end
      else
        flash[:error] = "Adresse ist ungültig. Bitte erneut versuchen"
        redirect_to :action => 'new'
      end
    end
  end

end
