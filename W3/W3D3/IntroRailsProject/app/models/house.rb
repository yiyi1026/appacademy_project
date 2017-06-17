class House < ApplicationRecord
  validate :owner_id

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Person
end
