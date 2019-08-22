class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	validates :friend_id, presence: true

	validate :check_for_duplicates

	def check_for_duplicates
		if Friendship.where(friend_id: friend_id, user_id: user_id).any?
			errors.add(:friend, " is already a friend!")
		end
	end
end
