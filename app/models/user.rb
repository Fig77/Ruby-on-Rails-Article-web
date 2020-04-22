class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, foreign_key: :author_id
  has_many :votes

  validates :username, length: { minimum: 3 }, presence: true, 
  			uniqueness: true
end
