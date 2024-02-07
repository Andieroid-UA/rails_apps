class PostsController < ApplicationController
    # Go to routes.rb and look for /posts
    before_action :set_post, only: [:update, :destroy, :show]
  
    def index
      posts = Post.all
      render json: posts, status: :ok
    end

    def show
      render json: @post, status: :ok
    end

    def create
      post = Post.new(post_params)
  
      if post.save
        render json: post, status: :created
      else
        render json: post.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @post.update(post_params)
        render json: @post, status: :ok
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end  
  
    def destroy
      if @post.destroy
        render json: nil, status: :ok
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.permit(:content, :user_id)
    end
  end
  