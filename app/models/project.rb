class Project < ApplicationRecord
    default_scope -> { order(created_at: :asc) }

    # 関連付け

    belongs_to :user
    has_many :comments, dependent: :destroy # プロジェクトが消失するとコメントも消える    

    # いいね機能の likeと関連付け
    has_many :likes
  
     # 2の関係
    has_many :liked_users, through: :likes, source: :user

    has_many :entries, dependent: :destroy
    validates :create_title, presence: true, length: { maximum: 50 }
    validates :period, presence: true
    validates :capacity, presence: true
    validates :content, presence: true, length: { maximum: 5000 }
    validates :work_method, presence: true
    validates :communication, presence: true
    validates :user_id, presence: true

    #応募しているかどうかを試す
    def entried_by? user
         entries.where(user_id: user.id).exists?
    end
end
