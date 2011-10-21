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

  scope :published, where('published = ? and publish_date < ?', true, Time.now).order("publish_date DESC")

  scope :with_category, lambda { |category| where('category = ?', category) }

  def generate_slug
    self.slug = self.title.dup if self.slug.blank?
    self.slug.slugorize!
  end
  
end
