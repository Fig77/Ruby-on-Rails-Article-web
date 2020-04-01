class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :author_id, references: :users, foreign_key: { to_table: :users }
      t.string :title
      t.string :text
      t.string :image
      

      t.timestamps
    end
  end
end
