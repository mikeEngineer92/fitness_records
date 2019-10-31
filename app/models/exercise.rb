class Exercise < ApplicationRecord
  validates :event, presence: true, length: {maximum: 20}
  has_many :menus, dependent: :destroy
end
