class CreateSocialstyles < ActiveRecord::Migration[5.1]
  def change
    create_table :socialstyles do |t|
      t.text :name
      t.text :characteristic
      t.text :celebrities
      t.text :weakness
      t.text :compatibility
      t.text :relationship

      t.timestamps
    end
  end
end
