class User < ApplicationRecord
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :graphs, dependent: :destroy

  
  validates :email, presence: true, 
                    length: { maximum: 255 } ,
                    allow_nil: true
                    

  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true                  
end
