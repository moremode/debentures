class Parameter < ApplicationRecord
  validates :loan_amount, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :year_percent, presence: true
end
