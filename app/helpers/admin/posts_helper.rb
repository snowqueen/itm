module Admin::PostsHelper
  def publish_label(published, attributes = {}, &block)
    if published
      attributes["class"] = "published"
    else
      attributes["class"] = "unpublished"
    end
    content_tag("span", attributes, &block)
  end
end
