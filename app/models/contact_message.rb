class ContactMessage < ActiveRecord::Base

  validates :name, :presence => true
  validates :email, :presence => true, :email => true
  validates :subject, :presence => true
  validates :message, :presence => true

end
