class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true

  after_initialize :ensure_session_token
  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
