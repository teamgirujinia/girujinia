class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
