# frozen_string_literal: true

class User < ApplicationRecord
  validates :mobile, presence: true
  validates :mobile, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 16 }
  validates :password_digest, presence: true
  validates :nickname, length: { minimum: 2, maximum: 10 }

  has_secure_password

  def self.with_token(token); end
end
