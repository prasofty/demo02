module ArticlesHelper

  def tag_cloud
    cloud_links = "<div class='tag_cloud'>"
    Tag.last(20).each do |tag|
      cloud_links += " " + (link_to tag.name, articles_tag_path(tag.name), :class => "label")
    end
    cloud_links += "</div>"
  end

  def users_list
    user_links = "<ul class='unstyled user_links'>"
    User.last(10).each do |user|
      user_links += "<li>" + (link_to user.email, user_articles_path(user.id), :class => "") + "</li>"
    end
    user_links += "</ul>"
  end
end
