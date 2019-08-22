class Post < ApplicationRecord
	belongs_to :author, class_name: "User", foreign_key: "user_id"
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :content, presence: true
 
	def user_already_liked?(post, current_user)
		if Like.where(user_id: current_user.id, post_id: post.id).any?
			true
		else
			false
		end
	end
end
