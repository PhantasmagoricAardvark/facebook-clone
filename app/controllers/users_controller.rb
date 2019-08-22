class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index,:show]

  def index
  	@users = User.where("id != ?", current_user.id)
  end

  def show
  	@user = User.find(params[:id])
  	@incoming = FriendRequest.where(friend_id: @user.id)
  	@pending = @user.friend_requests
  	@posts = @user.posts
  end

end
