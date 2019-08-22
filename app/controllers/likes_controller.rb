class LikesController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@like = Like.new(user_id: current_user.id, post_id: @post.id)
  	if @like.save
  		flash[:success] = "Post liked!"
  		redirect_to @post
  	else
  		flash[:error] = @like.errors.full_messages
  		redirect_to @post
  	end
  end

  def destroy
  	@post = Post.find(params[:post_id])
  	@like = Like.find_by(user_id: current_user.id, post_id: @post.id)
  	if @like.destroy
  		flash[:success] = "Post unliked!"
  		redirect_to @post
  	else
  		flash[:error] = @like.errors.full_messages
  		redirect_to @post
  	end
  end
end
