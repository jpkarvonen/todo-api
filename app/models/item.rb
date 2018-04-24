class Item < ApplicationRecord
  belongs_to :list

  validates :description, length: { minimum: 1, maximum: 500 }, presence: true
end
