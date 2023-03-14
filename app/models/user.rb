class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  before_save :normalize_email

  def normalize_email
    self.email = self.email.downcase.strip
  end

  # methods that work on classes need to reference self
  def self.authenticate_with_credentials(email, password)
    clean_email = email.strip.downcase
    user = User.find_by_email(clean_email)
    if user && user.authenticate(password)
      user
    else 
      nil
    end
  end


end
