# frozen_string_literal: true

class User < ApplicationRecord
  enum gender: %i(male female)

  validates :mobile, presence: true
  validates :password_digest, presence: true
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true

  validates :mobile, length: { is: 11 }
  validates :nickname, length: { minimum: 2, maximum: 10 }
  validates :description, length: { maximum: 100 }
  validates :password, length: { minimum: 6, maximum: 16 }, allow_nil: true

  validates :mobile, uniqueness: true
  validates :mobile, format: { with: /\d{11}/ }

  after_initialize :set_default_value

  has_secure_password

  def set_auth_token
    update_attributes(auth_token: nil)
    while auth_token.nil?
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
      next if User.find_by(auth_token: token)
      update_attributes(auth_token: token)
    end
    auth_token
  end

  def set_default_value
    self.birthday = Time.now.to_date unless birthday
    self.gender = 'female' unless gender
  end
end
