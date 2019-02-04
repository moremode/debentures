class Debenture < ApplicationRecord
  belongs_to :passport1, :class_name => "Passport"
  belongs_to :passport2, :class_name => "Passport"
  validates :count, presence: true
  validates :date, presence: true
  validates :last_date, presence: true
  validates :percent, presence: true
end
