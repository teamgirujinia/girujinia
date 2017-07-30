class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
        
        t.references :project,null: false, foreign_key: true # プロジェクトのID 
        t.references :user, null: false, foreign_key: true # current_user.idを入れる
        t.integer    :owner_id,null: false # projectを作ったuser_idを入れる

      t.timestamps
    end
  end
end
