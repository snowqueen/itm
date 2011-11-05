# coding: utf-8
class Post < ActiveRecord::Base

  CATEGORIES = ['Hírek', 'Önkormányzat', 'Turizmus', 'Közérdekű', 'Teszt']

  belongs_to :author, :class_name => 'User'

  before_validation :generate_slug

  validates :author, :presence => true
  validates :title, :presence => true
  validates :summary, :presence => true
  validates :content, :presence => true

  has_many :comments, :order => "updated_at"

  scope :published, lambda { |published = true| where('published = ? and publish_date < ?', published, Time.now).order("publish_date DESC")}

  scope :with_category, lambda { |category| where('category = ?', category) }

  def generate_slug
    self.slug = self.title.dup if self.slug.blank?
    self.slug.slugorize!
  end

  def self.search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}%"}
      #find_by_sql(["select p.* from posts p where published = ? and publish_date < ? and (#{ (["(lower(p.title) like ? or lower(p.summary) like ? or lower(p.content) like ?)"] * tokens.size).join(" or ") }) order by p.created_at desc", true, Time.now, *(tokens * 3).sort])
      where(["#{ (["(lower(title) like ? or lower(summary) like ? or lower(content) like ?)"] * tokens.size).join(" or ") }", *(tokens * 3).sort]).published
    else
      []
    end
  end
  
end
