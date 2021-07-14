FactoryBot.define do
  factory :citizen do
    name { FFaker::Name.name }
    cpf  { FFaker::IdentificationBR.cpf }
    cns  { [*1..99999].sample }
    birth_date { FFaker::Time.date }
    phonenumber { FFaker::PhoneNumberBR.international_mobile_phone_number.delete('^0-9') }
    photo { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/app/assets/images/logo.png")) }
    status { %w[A B].sample }
    address
  end
end
