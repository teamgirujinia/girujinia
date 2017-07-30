class Tag < ApplicationRecord
  validates :name,presence:true,length:{maximum:50}, uniqueness: true
end
