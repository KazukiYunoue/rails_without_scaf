class Entry < ActiveRecord::Base
  belongs_to :blog
  has_many :comments
  validates :title, presence: true, length: { maximum: 140 }
end