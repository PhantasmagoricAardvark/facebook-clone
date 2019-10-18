class PostsController < ApplicationController
	before_action :authenticate_user!

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(content: params[:post][:content], title: params[:post][:title])
		if @post.save
			flash[:success]
			redirect_to posts_path
		else
			flash[:error] = @post.errors.full_messages
			redirect_to new_post_path
		end		
	end

  def index
  	@posts = Post.where(author: current_user.friends).or(Post.where(author: current_user)).order(created_at: :desc)
  	@all_posts = Post.all.order(created_at: :desc)
  end

  def show
  	@post = Post.find(params[:id])
  	@likes = @post.likes
  	@comment = Comment.new
  	@comments = @post.comments.order(created_at: :desc)
  end
end
