class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  belongs_to :team, dependent: :destroy
  belongs_to :school
  validates :last_name, :first_name, :github_username, presence: true
  validates :github_username, :email, uniqueness: true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.name.split(" ").first
        user.last_name = auth.info.name.split(" ").last
        user.github_username = auth.info.nickname
        user.avatar_url = auth.extra.raw_info.avatar_url
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end



  def name
    [first_name, last_name].join(' ')
  end

end
