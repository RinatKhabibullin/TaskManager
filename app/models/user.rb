class User < ApplicationRecord
  attr_accessor :password_reset_token
  has_secure_password
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :email, uniqueness: true
  validates :email, format: { with: /@/ }

  def new_hash(string)
    BCrypt::Password.create(string)
  end

  def new_token
    SecureRandom.urlsafe_base64
  end

  def generate_password_reset_token!
    self.password_reset_token = self.new_token
    update(reset_password_token_hash: self.new_hash(password_reset_token), token_generate_time: Time.zone.now)
  end

  def remove_password_reset_token!
    update(reset_password_token_hash: nil, token_generate_time: nil)
  end

  def password_reset_token_active?
    token_generate_time > 24.hours.ago
  end

  def token_validation?(token)
    BCrypt::Password.new(self.reset_password_token_hash) == token
  end
end
