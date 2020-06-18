class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :fullname, presence: true, length: { in: 4..40 }
  
  has_many :reviews, dependent: :destroy
  has_many :followers, :class_name => "Following", :foreign_key => "followed_id", dependent: :destroy
  has_many :following, :class_name => "Following", :foreign_key => "follower_id", dependent: :destroy
  has_many :followers_list, through: :followers, source: :follower
  has_many :following_list, through: :following, source: :followed

  scope :all_but, ->(user) { where.not(id: user) }

  def tob_followed
    User.all_but(self).map { |usr| usr unless following?(usr) }.compact
  end

  # Checks for followership
  def following?(user)
    following_list.include?(user)
  end

end
