class User < ApplicationRecord

  # ユーザー画像
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable


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

end
