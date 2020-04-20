class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
  order_group = if Rails.env.production?
                  "SELECT DISTINCT ON (category_id) id
                   FROM article_categories
                   ORDER BY category_id, created_at DESC"
                else
                  "SELECT id  FROM
                  (SELECT * FROM article_categories ORDER BY created_at DESC)
    				      AS sub GROUP BY category_id"
                end
  scope :new_all, lambda {
    where(id: find_by_sql(order_group)).includes(:category, article: [:author, { image_attachment: :blob }])
  }

  scope :ordered_by_most_recent, -> { order(created_at: :desc).group_by(:category_id) }
end
