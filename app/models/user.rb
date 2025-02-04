class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true # 空白でないことを確認
  validates :email, presence: true, uniqueness: true # 一意であること
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthday, presence: true

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP # emailに@が含まれているかのバリデーション
end
