# frozen_string_literal: true

class User < ApplicationRecord
  validates :mobile, presence: true
  validates :password_digest, presence: true
  validates :nickname, presence: true

  validates :mobile, length: { is: 11 }
  validates :nickname, length: { minimum: 2, maximum: 10 }
  validates :password, length: { minimum: 6, maximum: 16 }

  validates :mobile, uniqueness: true
  validates :mobile, format: { with: /\d{11}/ }

  has_secure_password

  def self.with_token(_token); end
end
