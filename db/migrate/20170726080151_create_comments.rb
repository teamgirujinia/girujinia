class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

        t.integer :user_id # userデータが入る
        t.text    :content # コメント
        t.references :project # 関連付け
        
      t.timestamps
    end
      # 制約を付ける
      add_foreign_key :comments, :users, column: :user_id
      add_foreign_key :comments, :projects, column: :project_id
  end
end
