class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

        t.integer :user_id
        t.text    :content
        t.references :project
        
      t.timestamps
    end
      add_foreign_key :comments, :users, column: :user_id
      add_foreign_key :comments, :projects, column: :project_id
  end
end
