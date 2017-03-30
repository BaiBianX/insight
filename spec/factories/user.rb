# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    mobile { Faker::Number.number(13) }
    password 'password'
    password_confirmation 'password'
    nickname 'User'
  end
end
