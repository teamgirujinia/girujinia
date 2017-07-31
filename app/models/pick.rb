class Pick < ApplicationRecord
    belongs_to :user
    belongs_to :project
    
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: :project_id }
    validates :project, presence: true
end
