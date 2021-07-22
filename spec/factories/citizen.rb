FactoryBot.define do
  factory :citizen do
    name { FFaker::Name.name }
    email { FFaker::Internet.safe_email }
    cpf  { FFaker::IdentificationBR.cpf }
    cns  { [772142657606971, 795810425176758, 787997418124483, 876244696079219].sample }
    birth_date { (30.year.ago.to_date..Date.today).to_a.sample }
    phonenumber { FFaker::PhoneNumberBR.mobile_phone_number.delete('^0-9') }
    photo { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/app/assets/images/logo.png")) }
    status { %w[A B].sample }
    address
  end
end
