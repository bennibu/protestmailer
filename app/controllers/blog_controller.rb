class BlogController < ApplicationController

  def index
    @posts = Post.all(:limit => 3)
  end

  def show
    @post = Post.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Newsbeitrag konnte nicht gefunden werden!"
    redirect_to blog_url
  end

  def archive
    @posts = Post.all
  end

end
