class SiteController < ApplicationController

  def index
    @page = Page.find(:first, :conditions => {:homepage => true})

    render :action => 'show'
  end

  def show
    @page = Page.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Seite konnte nicht gefunden werden"
    redirect_to root_url
  end
end
