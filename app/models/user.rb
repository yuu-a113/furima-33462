class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  validates :nickname, uniqueness: true, presence: true
  validates :bday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,100}\z/
  # VALID_PASSWORD_REGEX = /\A[a-zA-Z\d]{6,100}+\z/i

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/



  validates :password, presence: true,
                       format: {
                        with: VALID_PASSWORD_REGEX,
                        message: "is invalid"
                       }

  validates :last_name, presence: true,
                        format: {
                          with: VALID_NAME_REGEX,
                          message: "is invalid"

                        }

  validates :first_name, presence: true,
                         format: {
                          with: VALID_NAME_REGEX,
                          message: "is invalid"
                         }

  validates :last_name_kana, presence: true,
                             format: {
                               with: VALID_KANA_REGEX,
                               message: "is invalid"
                              }

  validates :first_name_kana, presence: true,
                              format: {
                                with: VALID_KANA_REGEX,
                                message: "is invalid"
                              }

end
