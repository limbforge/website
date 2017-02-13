class PostsController < ApplicationController
  include AmazonSignature
  before_action :authenticate_user! , except: [:index, :show]
  def index
    @posts = Post.order('updated_at asc')
    redirect_to "/"
  end
  def new
    @categories_list = Category.all
    @post = Post.new
    @hash = AmazonSignature::data_hash
  end

  def show
    @post = Post.find_by_slug(params[:id])
    @categories_list = @post.categories

    @related_posts = []

    @categories_list.each do |category|
      if category.posts.length > 0
        category.posts.each do |post|
          if (post != @post) && (!@related_posts.include?(post))
            @related_posts << post
          end
        end
      end
    end
  end

  def edit
    @categories = Category.all
    @hash = AmazonSignature::data_hash
    @post = Post.find_by_slug(params[:id])
    @categories_list = @post.categories
  end

  def update
    @post = Post.find_by_slug(params[:id])
    if params[:post][:category_ids] != nil
      @post.categories.each do |category|
          @post.categories.delete(category)
      end
      params[:post][:category_ids].each do |category|
        @post.categories <<  Category.find( category.to_f)
      end
    end
    if params[:post][:created_at].length < 23
      @post.created_at =  DateTime.strptime(params[:post][:created_at] + ' 00:00:00', '%m/%d/%Y %H:%M:%S')
      @post.save
    end
    @post.update(params[:post].permit(:title, :description, :body, :image,:category_ids, :logo, :id))

    if @post.update(params[:post].permit(:title,:description, :body, :image,:category_ids, :logo, :id))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def create
    @hash = AmazonSignature::data_hash
    @post = Post.new(post_params)
    params[:post][:category_ids].each do |category|
      if !@post.categories.include?(Category.find( category.to_f))
        @post.categories <<  Category.find( category.to_f)
      end
    end
    @post.save
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  private
    def post_params
      params.require(:post).permit(:title, :body, :description, :logo, :image,:created_at , :category_ids)
    end
end