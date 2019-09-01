class Blog < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :comments, through: :entries
end
