class City < ApplicationRecord
  belongs_to :state

  def to_s
    name
  end
end