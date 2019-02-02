class Passport < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :serial, presence: true
  validates :number, presence: true
  validates :given, presence: true
  validates :address, presence: true
end
