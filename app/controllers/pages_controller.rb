class PagesController < ApplicationController

  def userlist
    if user_signed_in?
      @users = User.all
    else
      redirect_to posts_path
    end
  end

  def dashboard
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to posts_path
    end
  end

  def home
    @contact = Contact.new
    @posts = Post.paginate(:page => params[:page], :per_page => 9).order('created_at desc')
  end
end
