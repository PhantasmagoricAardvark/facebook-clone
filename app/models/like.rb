class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validate :check_for_additional_likes

  def check_for_additional_likes
  	if Like.where(post_id: post_id, user_id: user_id).any?
  		errors.add(:like, "already exists! You already liked it!")
  	end
  end
end
