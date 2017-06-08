module ApplicationHelper
  # Sets the title of all pages
  def full_title(page_title)
    base_title = "CodeZen"
    page_title.empty? ? base_title : "#{base_title} - #{page_title}"
  end

  # Returns the gravatar for the given user
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
