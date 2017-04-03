# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    mobile { Faker::Number.number(11) }
    nickname { Faker::Internet.user_name(2..10) }
    password 'password'
    gender :male
    description { Faker::Lorem.sentences(1) }
    educations { Array.new(Faker::Number.between(1, 10)) { Faker::Address.city } }
    locations { Array.new(Faker::Number.between(1, 10)) { Faker::Educator.university } }
    experience { Array.new(Faker::Number.between(1, 10)) { Faker::Food.ingredient } }
  end
end
