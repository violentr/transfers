class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 20}
  validates :last_name, presence: true, length: { maximum: 20}
  validates :address_line_1, presence: true, length: { maximum: 50}
  validates :dob, presence: true

  has_many :transfers
end
