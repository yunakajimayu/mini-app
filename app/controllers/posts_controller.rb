class PostsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.order(created_at: :DESC)
  end

  def new
    @posts= Post.new
  end

  def create
    @posts = Post.create(title: post_params[:title],content: post_params[:content] ,user_id: current_user.id) 
  end

  def show
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id ==current_user.id
  end

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
     post.update(post_params) if post.user_id == current_user.id 
  end

  
  private
  def post_params
      params.permit(:title, :content)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
    end
  end