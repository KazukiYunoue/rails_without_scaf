class Entry < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: { maximum: 140 }
end