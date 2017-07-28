class Project < ApplicationRecord
    # 関連付け
    belongs_to :user
    has_many :comments, dependent: :destroy # プロジェクトが消失するとコメントも消える    

    # いいね機能の likeと関連付け
    has_many :likes
  
     # 2の関係
    has_many :liked_users, through: :likes, source: :user


end
