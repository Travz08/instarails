class Photo < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  include ImageUploader[:image]

end
