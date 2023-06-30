class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :emotions
  # has_many :action_plans
  # has_many :histories
  # has_many :comments
 
  validates :nickname, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: "は全角文字で入力してください" }
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
end
