class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :fullname, presence: true, length: { in: 4..40 }
  
  has_many :reviews
  has_many :followers, :class_name => "Following", :foreign_key => "followed_id"
  has_many :following, :class_name => "Following", :foreign_key => "follower_id"
  has_many :followers_list, through: :followers, source: :follower
  has_many :following_list, through: :following, source: :followed
end
