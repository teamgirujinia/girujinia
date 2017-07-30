class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :create_title
      t.string :period
      t.integer :capacity
      t.text :content
      t.string :work_method
      t.string :communication
      t.string :job_first
      t.string :job_secound
      t.string :job_third
      t.integer :user_id
      t.string :lang1
      t.string :lang2
      t.string :lang3
      t.string :dev_type
      t.string :tool
      t.integer :pv, null: false, default: 0
      
      t.timestamps
    end

  end
end
