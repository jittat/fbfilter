class PostsController < ApplicationController

  skip_before_action :verify_authenticity_token
  
  def new
  end

  def create
    @post = Post.new(url: params[:post][:url])
    @post.verified = false
    @post.ignored = false

    begin
      if @post.save
        redirect_to @post
      else
        redirect_to posts_path
      end
    rescue
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.where verified: true
  end

  def unverified
    @posts = Post.where({ verified: false, ignored: false })
  end
  
  def verified
    @posts = Post.where({ verified: true, ignored: false })
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def verify
    @post = Post.find(params[:id])
    @post.verified = true
    @post.save
    redirect_to posts_unverified_path
  end

  def ignore
    @post = Post.find(params[:id])
    verified = @post.verified

    @post.ignored = true
    @post.verified = false
    @post.save

    if verified
      redirect_to posts_verified_path
    else
      redirect_to posts_unverified_path
    end      
  end
end
