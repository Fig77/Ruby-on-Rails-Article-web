class AddAttachmentImageToArticles < ActiveRecord::Migration[5.0]
  def up
    add_attachment :articles, :image
  end

  def down
    remove_attachment :articles, :image
  end
end
