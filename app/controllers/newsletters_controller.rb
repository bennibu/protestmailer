class NewslettersController < ApplicationController

  layout 'admin'
  before_filter :authenticate_admin

  def index
    @newsletters = Newsletter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletters }
    end
  end

  
  def show
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter }
    end
  end

  
  def new
    @newsletter = Newsletter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletter }
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def create
    @newsletter = Newsletter.new(params[:newsletter])

    respond_to do |format|
      if @newsletter.save
        flash[:notice] = 'Newsletter was successfully created.'
        format.html { redirect_to(@newsletter) }
        format.xml  { render :xml => @newsletter, :status => :created, :location => @newsletter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end

 def update
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      if @newsletter.update_attributes(params[:newsletter])
        flash[:notice] = 'Newsletter was successfully updated.'
        format.html { redirect_to(@newsletter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    respond_to do |format|
      format.html { redirect_to(newsletters_url) }
      format.xml  { head :ok }
    end
  end

  def send_test
    newsletter = Newsletter.find(params[:id])
    recipient = params[:prompt_reply].blank? ? APP_CONFIG[:mail_sender] : params[:prompt_reply]

    Mailer.deliver_newsletter(newsletter.subject, newsletter.plain, newsletter.html, recipient, recipient)

    flash[:notice] = "Testmail wurde an #{recipient} verschickt."
    redirect_to newsletter
  end

  def deliver
    newsletter = Newsletter.find(params[:id])

    unless newsletter.send_at
      call_rake :send_newsletter, :newsletter_id => newsletter.id
      flash[:notice] = "Newsletter wird verschickt"
    else
      flash[:error] = "Achtung, der newsletter wurde schon einmal verschickt."
    end

    redirect_to newsletter
  end
end
