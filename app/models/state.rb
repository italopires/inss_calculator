class State < ApplicationRecord
  has_many :cities

  def to_s
    name
  end
end