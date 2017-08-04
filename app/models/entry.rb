class Entry < ApplicationRecord
    
     belongs_to :user
     belongs_to :project
   
    # -----------------------------------------------------------------------------------
    
    # バリデーション
    
    # -----------------------------------------------------------------------------------
    validates :pairs, uniqueness: true
  
end
