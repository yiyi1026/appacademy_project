class Person < ApplicationRecord
  validate :name, :age, presence: true

  has_many :houses,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :House
end
