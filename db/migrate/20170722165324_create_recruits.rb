class CreateRecruits < ActiveRecord::Migration[5.1]
  def change
    create_table :recruits do |t|
      t.string :create_title #作りたいもの
      t.integer :period #期間
      t.integer :people #募集人数
      t.text :contents #内容
      t.string :work_method #作業方法
      t.string :communication #コミュニケーション方法
      t.string :wanted_jobs #募集職種
      t.integer :user_id # create_titleにuser_idを入れる

      t.timestamps


    end
      # create_title 重複不可
      add_index :recruits, :create_title, unique: true
  end
end
