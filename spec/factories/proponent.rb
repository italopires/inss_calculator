FactoryBot.define do
  factory :proponent do
    name { FFaker::NameBR.name }
    cpf { FFaker::NameBR.name }
    birthdate { FFaker::Time.date }
    public_place { FFaker::Address.secondary_address }
    address_number { FFaker::Address.building_number }
    neighborhood { FFaker::Address.neighborhood }
    cep { FFaker::AddressBR.zip_code }
    personal_phone { FFaker::PhoneNumber.phone_number }
    reference_phone { FFaker::PhoneNumber.phone_number }
    salary { rand(100..3000.0) }
    inss_discount { rand(100..3000.0) }
  end
end
