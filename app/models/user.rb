class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos
  has_many :comments, dependent: :destroy
  acts_as_voter
  def self.search(search)
  where("username LIKE ?", "%#{search}%")
  end
end
