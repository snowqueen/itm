class Post < ActiveRecord::Base

  belongs_to :author, :class_name => 'User'

  validates :author, :presence => true
  validates :title, :presence => true
  validates :summary, :presence => true
  validates :content, :presence => true

  has_many :comments
  
end
