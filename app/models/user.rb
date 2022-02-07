class User < ApplicationRecord
  validates :nickname, presence: true
  validates :last_name, presence: true, format: /\A[ぁ-んァ-ヶー-龥々ー]+\z/
  validates :first_name, presence: true, format: /\A[ぁ-んァ-ヶー-龥々ー]+\z/
  validates :last_name_kana, presence: true, format: /\A[ァ-ヶー]+\z/
  validates :first_name_kana, presence: true, format: /\A[ァ-ヶー]+\z/
  validates :birthday, presence: 
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
