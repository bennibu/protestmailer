class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.valid?
      @invitation.send_mails
      flash[:notice] = "Deine Freunde wurden soeben informiert"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

end
