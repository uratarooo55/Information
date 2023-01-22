class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :genre
      t.text :memo
      t.string :site
      t.string :youtube
      t.text :comment
     

      t.timestamps
    end
  end
end
