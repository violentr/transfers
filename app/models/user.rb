class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 20}
  validates :last_name, presence: true, length: { maximum: 20}
  validates :address_line_1, presence: true, length: { maximum: 50}
  validates :dob, presence: true
  validates_presence_of :username, :email
  validates :email, uniqueness: true

  has_many :transfers

  has_secure_password
  def name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.current
    age = now.year - dob.year
    age -= 1 if now.yday < dob.yday
  end

end
