# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    mobile { Faker::Number.number(11) }
    nickname { Faker::Internet.user_name(2..10) }
    password 'password'
    password_confirmation 'password'
  end
end
