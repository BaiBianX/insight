# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    mobile { Faker::Number.number(13) }
    nickname { Faker::Internet.user_name }
    password 'password'
    password_confirmation 'password'
  end
end
