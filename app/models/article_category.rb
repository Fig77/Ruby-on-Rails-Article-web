class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
  scope :new_all, -> { 
  ArticleCategory.ordered_by_most_recent.select(:category_id, :id,:article_id)
  .includes(:article, :category)
  }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
