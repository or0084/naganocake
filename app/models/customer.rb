class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable





  has_many :orders, dependent: :destroy

  enum is_active: {
    有効: true,
    退会: false
  }
end
