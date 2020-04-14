class AddPriorityToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :priority, :integer, default: 0
  end
end
