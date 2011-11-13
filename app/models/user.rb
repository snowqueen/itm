class User < ActiveRecord::Base

  apply_simple_captcha

  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :email => true

  validates :password, :confirmation => true, :length => {:minimum => 5}

  validate :password_must_be_present

  attr_reader :password
  attr_accessor :password_confirmation

  after_destroy :ensure_an_admin_remains

  has_many :comments

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, self.salt)
    end
  end

  def self.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def self.encrypt_password(password, salt)
    Digest::SHA256.hexdigest(password + 'Pr4tty_W0man' + salt)
  end

  def admin?
    self.admin
  end
  
  def ensure_an_admin_remains
    if User.where(:admin => true).count.zero?
      raise "Can't delete last admin user!"
    end
  end


  private
    def password_must_be_present
      errors.add(:password) unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end

end
