class User < ApplicationRecord
  belongs_to :passport, required: false
end
