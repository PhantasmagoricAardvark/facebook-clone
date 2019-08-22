class FriendRequestsController < ApplicationController
  def create
  	@friend_request = FriendRequest.new(user_id: current_user.id, friend_id: params[:friend_id])
  	if @friend_request.save
  		flash[:success] = "Friend request sent!"
  		redirect_to users_path
  	else
  		flash[:error] = @friend_request.errors.full_messages
  		redirect_to users_path
  	end
  end

  def update
  	@friend_request = FriendRequest.find_by(friend_id: params[:friend_id], user_id: params[:user_id])
  	@inverse_user = User.find(params[:user_id])
  	@friendship = current_user.friendships.build(friend_id: params[:user_id])
  	@inverse_friendship = @inverse_user.friendships.build(friend_id: params[:friend_id])
  	if @friendship.save
  		@inverse_friendship.save
  		@friend_request.destroy
  		flash[:success] = "Friend request accepted!"
  		redirect_to current_user
  	else
  		flash[:error] = @friendship.errors.full_messages
  		redirect_to current_user
  	end
  end


end
