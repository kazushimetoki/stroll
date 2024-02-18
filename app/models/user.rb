class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :first_name_kana, presence: true, length: { maximum: 30 }
  validates :last_name_kana, presence: true, length: { maximum: 30 }
         
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews
         
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.first_name = 'guest'
      user.last_name = 'guest'
      user.first_name_kana = 'guest'
      user.last_name_kana = 'guest'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
   end
  end      
end
