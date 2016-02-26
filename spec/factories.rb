FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :fighter, aliases: [:winner, :loser] do
    sequence(:first_name) { FFaker::Name.first_name }
    sequence(:last_name) { FFaker::Name.last_name }
    experience 100
    description FFaker::Lorem.paragraph
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'db/placeholders/250x300.png')) }
  end

  factory :melee_skill, class: 'Skill' do
    name 'melee'
    level 3
  end

  factory :knives_skill, class: 'Skill' do
    name 'knives'
    level 2
  end

  factory :fight do
    winner
    loser
  end
end
