class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :books, dependent: :destroy
  attachment :profile_image
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end