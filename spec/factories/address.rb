FactoryBot.define do
  factory :address do
    zipcode { FFaker::AddressBR.zip_code }
    address { FFaker::AddressBR.street_name }
    residencial_number { [*1..999].sample }
    complement { FFaker::AddressBR.secondary_address }
    neighborhood { FFaker::AddressBR.neighborhood }
    city { FFaker::AddressBR.city }
    state { FFaker::AddressBR.country_code }
    ibge_code { [*1..99999].sample }
  end
end
