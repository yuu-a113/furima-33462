class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,100}\z/
  # VALID_PASSWORD_REGEX = /\A[a-zA-Z\d]{6,100}+\z/i

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]/

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :bday
    validates :password,format: {
                        with: VALID_PASSWORD_REGEX,
                        message: "is invalid"
                       }
    with_options format: {with: VALID_NAME_REGEX,message: "is invalid"} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: VALID_KANA_REGEX,message: "is invalid"} do
      validates :last_name_kana
      validates :first_name_kana
    end


  end
end
