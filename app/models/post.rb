# encoding: utf-8
class Post < ActiveRecord::Base

  CATEGORIES = ['Hírek', 'Önkormányzat', 'Turizmus', 'Közérdekű', 'Teszt']

  belongs_to :author, :class_name => 'User'

  validates :author, :presence => true
  validates :title, :presence => true
  validates :summary, :presence => true
  validates :content, :presence => true

  has_many :comments
  
end
