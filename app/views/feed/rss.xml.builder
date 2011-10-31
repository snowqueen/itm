xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Hercegkút honlapja"
    xml.description "A blog about software and chocolate"
    xml.link root_url
    xml.lastBuildDate @posts.first.publish_date.to_s(:rfc822)
    xml.atom :link, :href=> feed_rss_url(:format => :xml), :rel => "self", :type => "application/rss+xml"
    for post in @posts
      xml.item do
        xml.title post.title
        xml.description strip_tags post.summary
        xml.pubDate post.publish_date.to_s(:rfc822)
        xml.link slug_url(post)
        xml.guid slug_url(post)
        xml.category post.category if post.category
      end
    end
  end
end
