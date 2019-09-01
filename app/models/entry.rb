class Entry < ActiveRecord::Base
  belongs_to :blog
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 140 }
end