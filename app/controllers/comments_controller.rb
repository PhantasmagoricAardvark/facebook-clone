class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = Comment.new(content: params[:comment][:content], post_id: params[:post_id], user_id: params[:user_id])
  	if @comment.save
  		flash[:success] = "Comment created!"
  		redirect_to @post
  	else	
  		flash[:error] = @comment.errors.full_messages
  		redirect_to @post
  	end	
  end
end
