class ProtestController < ApplicationController
  def index
    redirect_to :action => 'new'
  end

  def new
    @protest_mail = ProtestMail.new(
      :activist => Activist.new,
      :subject => "Vattenfall sucks!",
      :body => "Ein langer Text\nMit vielen Absätzen\nnoch einer\nund noch einer"
    )
  end

  def create
    @protest_mail = ProtestMail.new(params[:protest_mail])
    if @protest_mail.save
      flash[:notice] = "Protestmail wurde gespeichert. Du erhälst nun eine Link für die Bestätigung."
      redirect_to :action => 'verify'
    else
      render :action => 'new'
    end
  end

  def verify

  end

end
