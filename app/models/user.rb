class User < ApplicationRecord

  # ユーザー画像
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :validatable, :omniauthable


      # 関連付け
         has_many :projects, dependent: :destroy
         has_many :comments
         has_many :likes, dependent: :destroy
         has_many :liked_projects, through: :likes, source: :project
         has_many :entriesm, dependent: :destroy

  def already_liked?(project)
    self.likes.exists?(project_id: project.id)
  end


  # 既存のパスワードを入力せずにプロフィール編集可能に
  def update_without_current_password(params, *options)
     params.delete(:current_password)

     if params[:password].blank? && params[:password_confirmation].blank?
       params.delete(:password)
       params.delete(:password_confirmation)
     end

     result = update_attributes(params, *options)
     clean_up_passwords
     result
  end

  # 公式のサンプル(今回は使用しません)
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # 今回使用するメソッド
  def self.find_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first
  end

  def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
    if data = session["devise.facebook_data"]
      user.provider = data["provider"] if user.provider.blank?
      user.uid = data["uid"] if user.uid.blank?
      user.password = Devise.friendly_token[0,20] if user.password.blank?
    end
  end
  end
end
