class Comment < ApplicationRecord

    # 関連付け
    belongs_to :project
    belongs_to :user
end
