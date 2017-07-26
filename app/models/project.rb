class Project < ApplicationRecord
    # 関連付け
    belongs_to :user
    has_many :comments, dependent: :destroy # プロジェクトが消失するとコメントも消える
end
