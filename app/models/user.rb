class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :health_datum, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  has_one :health_datum, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  after_save :assign_profile

  def assign_profile
    Profile.create!(user_id: self.id)
  end


end
