class Project < ApplicationRecord
    default_scope -> { order(created_at: :asc) }

    # -----------------------------------------------------------------------------------

    # リレーション

    # -----------------------------------------------------------------------------------
    belongs_to :user

    has_many :comments, dependent: :destroy # プロジェクトが消失するとコメントも消える

    # いいね機能の likeと関連付け
    has_many :likes

     # 2の関係

    has_many :comments, dependent: :destroy

    has_many :likes, dependent: :destroy

    has_many :liked_users, through: :likes, source: :user

    has_many :picks, dependent: :destroy
    has_many :pick_users, through: :picks, source: :user

    has_many :entries, dependent: :destroy





    # -----------------------------------------------------------------------------------

    # バリデーション

    # -----------------------------------------------------------------------------------

    validates :create_title, presence: true, length: { maximum: 50 }
    validates :period, presence: true
    validates :capacity, presence: true
    validates :content, presence: true, length: { maximum: 5000 }
    validates :work_method, presence: true
    validates :communication, presence: true
    validates :user_id, presence: true




    #応募しているかどうかを返す
    def entried_by? user
         entries.where(user_id: user.id).exists?
    end

    #お気に入りしているかどうかを返す
    def picked_by? user
       picks.where(user_id: user.id).exists?
    end

    #お気に入りしているかどうかを返す
    def liked_by? user
       likes.where(user_id: user.id).exists?
    end


    paginates_per 10 # 11ページ目を分割

end
