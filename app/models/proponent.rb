class Proponent < ApplicationRecord
  belongs_to :state
  belongs_to :city

  validates :name, :cpf, :birthdate, :address_number, :neighborhood, :public_place, :cep,
    :personal_phone, :salary, :inss_discount, :state_id, :city_id, presence: true
end