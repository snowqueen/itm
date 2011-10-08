class Image < ActiveRecord::Base

  validates :title, :presence => true

  has_attached_file :binary, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
