class User < ApplicationRecord

      # ユーザー画像
      include Gravtastic
      gravtastic

      default_scope -> { order(experience_value: :asc) }

     # -------------------------------------------------------------------------------------------------------------------
     
     # Devise設定
     
     # -------------------------------------------------------------------------------------------------------------------
     
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable, :validatable,
             :confirmable, :lockable


     # -------------------------------------------------------------------------------------------------------------------
     
     # リレーション
     
     # -------------------------------------------------------------------------------------------------------------------
    
     has_many :projects, dependent: :destroy
     has_many :comments
     has_many :likes, dependent: :destroy
     has_many :liked_projects, through: :likes, source: :project
     has_many :entriesm, dependent: :destroy
     has_many :picks, dependent: :destroy
     has_many :pick_projects, through: :picks, source: :project

     # -------------------------------------------------------------------------------------------------------------------
     
     # その他
     
     # -------------------------------------------------------------------------------------------------------------------
     
      def already_liked?(project)
        self.likes.exists?(project_id: project.id)
      end
      
      # Homeのユーザーランキングデータの取得
      # rankの数値が高い順に取得
      def self.users_rank
          self.all.order("experience_value").first(10)
      end
  
  

end
