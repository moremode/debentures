class UsersDebenture < ApplicationRecord
  belongs_to :user
  belongs_to :debenture
end
