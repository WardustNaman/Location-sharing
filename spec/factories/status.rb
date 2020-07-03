FactoryBot.define do
  factory :status do
    name { "Public" }

    trait :missing_access_type do
      name {}
    end

    trait :empty_string_as_access_type do
      name { '' }
    end

    trait :invalidate_access_type_with_special_characters do
      name { '@#$%' }
    end
  end
end

