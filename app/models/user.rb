class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy

  validates_uniqueness_of :name, :email
  validates :name, :email, presence: true
  validates :password, length: { minimum: 8 }
end
