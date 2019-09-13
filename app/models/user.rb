class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :trips
  has_many :countries, through: :trips

  after_create :build_profile

  def build_profile
    Profile.create!(user_id: id)
  end
end
