class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6 }  
   # Validates email for uniqueness regardless of case
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    sanitized_email = email.downcase.strip
    user = find_by('LOWER(email) = ?', sanitized_email)
    if user && user.authenticate(password)
      user
    else
      puts "Authentication failed. User: #{user.inspect}, Password: #{password}"
      nil
    end
  end
end