class Debenture < ApplicationRecord
  belongs_to :passport1, :class_name => "Passport"
  belongs_to :passport2, :class_name => "Passport"
  belongs_to :parameter
  validates :parameter_id, presence: true;
end
