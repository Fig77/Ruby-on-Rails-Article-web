class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.integer :category
      t.integer :article_id

      t.timestamps
    end
  end
end
