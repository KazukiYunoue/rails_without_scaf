class Blog < ApplicationRecord
  has_many :entries
  has_many :comments, through: :entries
end
