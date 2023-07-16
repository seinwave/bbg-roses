FactoryBot.define do
  factory :plant do
    latitude { 1.5 }
    longitude { 1.5 }
    status { 0 }
    is_deleted { false }
    form { 0 }
    cultivar
    sector
  end
end
