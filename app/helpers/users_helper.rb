module UsersHelper

  def gravatar_url(user, *size)
    grav = Digest::MD5.hexdigest(user.email.downcase)
    if size.empty?
    	url = "https://www.gravatar.com/avatar/#{grav}"
    	image_tag(url, alt: "profile photo")
    else
    	size = size[0].to_s
    	url = "https://www.gravatar.com/avatar/#{grav}?s=#{size}"
    	image_tag(url, alt: "profile photo")
  	end
  end

end
