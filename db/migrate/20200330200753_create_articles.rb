class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.string :title
      t.string :text
      t.string :image

      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
