class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :create_title
      t.string :period
      t.integer :capacity
      t.text :content
      t.string :work_method
      t.string :communication
      t.string :wanted_jobs
      t.integer :user_id
      
      t.timestamps
    end

  end
end
