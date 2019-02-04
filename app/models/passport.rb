class Passport < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :serial, presence: true
  validates :number, presence: true
  validates :given, presence: true
  validates :address, presence: true
  validates :first_name, format: { with: /[А-Яа-я]/, message: "only allows letters" }
  validates :last_name, format: { with: /[А-Яа-я]/, message: "only allows letters" }
  validates :middle_name, format: { with: /[А-Яа-я]/, message: "only allows letters" }
  validates :serial, format: { with: /\d/, message: "only numbers" }, length: { is:4, message: "4 symbols"}
  validates :number, format: { with: /\d/, message: "only numbers" }, length: { is:6, message: "6 symbols"}
end
