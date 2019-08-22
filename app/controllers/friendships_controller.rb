class FriendshipsController < ApplicationController
  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
  	if @friendship.save
  		flash[:success] = "Friend added!"
  		redirect_to current_user
  	else
  		flash[:error] = @friendship.errors.full_messages
  		redirect_to users_path
  	end
  end

  def destroy
  end
end
