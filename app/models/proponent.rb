class Proponent < ApplicationRecord
  validates :name, :cpf, :birthdate, :address_number, :neighborhood, :public_place, :cep,
    :personal_phone, :salary, :inss_discount, presence: true
end