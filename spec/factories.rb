FactoryGirl.define do
  factory :fighter, aliases: [:winner, :loser] do
    first_name 'John'
    last_name 'Rambo'
    experience 100
    description 'Sample description'
    avatar 'avatar.png'
    won_fights
    lost_fights

    factory :fighter_with_skills do
      skills []
    end
  end

  factory :skill do
    name 'lasers'
    level 3
    fighter

    factory :melee_skill do
      name 'melee'
      fighter
    end

    factory :knives_skill do
      name 'knives'
      level 2
      fighter
    end
  end

  factory :fight do
    winner
    loser
  end
end
