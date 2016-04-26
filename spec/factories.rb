require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "email#{n}@email.com" }
    password "password"
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@admins.com" }
    password "password"
  end

  # factory :propic do
  #   photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/sampleprofile.jpg')))
  # end
end
