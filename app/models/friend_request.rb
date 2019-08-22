class FriendRequest < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	validates :user, presence: true
	validates :friend, presence: true

	validate :check_for_duplicates
	validate :cannot_send_to_self

	def check_for_duplicates()
		if FriendRequest.where(friend_id: friend_id, user_id: user_id).any?	|| FriendRequest.where(friend_id: user_id, user_id: friend_id).any?
			errors.add(:friend_request, "already exists!")
		elsif Friendship.where(friend_id: friend_id, user_id: user_id).any?
			errors.add(:friend, "already exists!")
		end
	end

	def cannot_send_to_self
		if friend_id == user_id
			errors.add(:friend_request, " cannot be sent to yourself!")
		end
	end
end