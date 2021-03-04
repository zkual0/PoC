require 'ostruct'

FactoryBot.define do
  factory :user, class: OpenStruct do
    nanme  { "John" }
    email  { "JohnDoe@example.com" }
    admin  { false }
  end
end

