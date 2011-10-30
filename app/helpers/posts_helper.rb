module PostsHelper

  def slug_path(post, options = {})
    post_slug_path(post.slug, options)
  end

end
